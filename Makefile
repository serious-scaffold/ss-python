.PHONY: clean deepclean dev pre-commit lint black mypy flake8 pylint pip-check-reqs toml-sort test build upload docs devdocs

# Construct pipenv run command with or without site-packages flag when not in CI environment and pipenv command exists.
SITE_PACKAGES_FLAG = $(shell [ "${SS_SITE_PACKAGES}" = "true" ] && echo --site-packages)
PIPRUN := $(shell [ "${CI}" != "true" ] && command -v pipenv > /dev/null 2>&1 && echo pipenv ${SITE_PACKAGES_FLAG} run)
SRCDIR := src

# Remove common intermediate files.
clean:
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -rf
	find . -name '__pycache__' -print0 | xargs -0 rm -rf
	-rm -rf \
		*.egg-info \
		.coverage \
		.eggs \
		.mypy_cache \
		.pytest_cache \
		Pipfile* \
		build \
		dist \
		output \
		public

# Remove common intermediate files alongside with `pre-commit` hook and virtualenv created by `pipenv`.
deepclean: clean
	-pre-commit uninstall --hook-type pre-push
	-pipenv --venv >/dev/null 2>&1 && pipenv --rm

# Determine whether to use virtualenv with site packages according to various situations:
# - Not in CI mode.
# - Command pipenv exists.
# - No existing virtualenv (site-packages flag only work ).
# - Env "SS_USE_SITE_PACKAGES" is true.
venv:
	-[ "${CI}" != "true" ] && command -v pipenv > /dev/null 2>&1 && ! pipenv --venv >/dev/null 2>&1 && [ "${SS_SITE_PACKAGES}" == "true" ] && pipenv --site-packages

# Install package in editable mode.
install:
	${PIPRUN} pip install --no-build-isolation -e . -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with specific optional dependencies. Valid options: docs, lint, tests.
dev-%: venv
	${PIPRUN} pip install --no-build-isolation -e .[$*] -c constraints/$(or $(CONSTRAINTS_VERSION),default).txt

# Prepare dev environments:
# - Install package in editable mode with all optional dependencies.
# - Install pre-commit hoook when not in CI environment.
dev: venv
	${PIPRUN} pip install --no-build-isolation -e .[dev] -c constraints/$(or $(CONSTRAINTS_VERSION),default).txt
	-[ "${CI}" != "true" ] && pre-commit install --hook-type pre-push

show-version:
	${PIPRUN} python -m setuptools_scm

# Run pre-commit for all files.
pre-commit:
	pre-commit run --all-files

# Lint with all tools: black, mypy, flake8, pylint and toml-sort.
lint: mypy flake8 pylint toml-sort

# Code formatter.
black:
	${PIPRUN} python -m black tests ${SRCDIR}

# Static typing checker.
mypy:
	${PIPRUN} python -m mypy tests ${SRCDIR}

# Style checker with various of plugins.
flake8:
	${PIPRUN} python -m flake8

# Static code analysis.
pylint:
	${PIPRUN} python -m pylint tests ${SRCDIR}

# Sort and format toml files.
toml-sort:
	${PIPRUN} toml-sort -a -i pyproject.toml

# Trigger tests.
test:
	${PIPRUN} python -m pytest --cov=${SRCDIR} --cov-fail-under=$(or $(TEST_COVERAGE_THRESHOLD),0) .

# Build package.
build:
	${PIPRUN} python -m build

# Upload package.
upload:
	${PIPRUN} python -m twine upload dist/*

# Generate docs.
docs:
	${PIPRUN} python -m sphinx.cmd.build docs public

# Auto build docs.
docs-autobuild:
	${PIPRUN} python -m sphinx_autobuild docs public
