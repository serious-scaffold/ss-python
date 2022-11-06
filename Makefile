.PHONY: clean deepclean dev pre-commit lint black mypy flake8 pylint pip-check-reqs toml-sort test build upload docs devdocs

# Use pipenv when not in CI environment and pipenv command exists.
PIPRUN := $(shell [ "${CI}" != "true" ] && command -v pipenv > /dev/null 2>&1 && echo pipenv run)
SITE_PACKAGE_FLAG = $(shell [ "${USE_SITE_PACKAGE}" == "true" ] && echo "--site-packages" )
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

# Prepare virtualenv.
venv:
	-[ "${CI}" != "true" ] && ! pipenv --venv >/dev/null 2>&1 && pipenv ${SITE_PACKAGE_FLAG}

# Install package in editable mode.
install: venv
	${PIPRUN} pip install -e . -c constraints/$(or $(CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with specific optional dependencies. Valid options: docs, lint, tests.
dev-%: venv
	${PIPRUN} pip install -e .[$*] -c constraints/$(or $(CONSTRAINTS_VERSION),default).txt

# Prepare dev environments:
# - Install package in editable mode with all optional dependencies.
# - Install pre-commit hoook when not in CI environment.
dev: venv
	${PIPRUN} pip install -e .[dev] -c constraints/$(or $(CONSTRAINTS_VERSION),default).txt
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

# [Experimental] Check missing/redundant requirements.
pip-check-reqs:
	${PIPRUN} pip-missing-reqs ${SRCDIR}
	${PIPRUN} pip-extra-reqs ${SRCDIR}

# Sort and format toml files (especially for pyproject.toml).
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
devdocs:
	${PIPRUN} python -m sphinx_autobuild docs public
