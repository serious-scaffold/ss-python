.PHONY: clean deepclean install dev version pre-commit lint black mypy flake8 pylint toml-sort test build upload docs docs-autobuild

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
		docs\_build \
		dist \
		output \
		public

# Remove common intermediate files alongside with `pre-commit` hook and virtualenv created by `pipenv`.
deepclean: clean
	-pre-commit uninstall --hook-type pre-push
	-pipenv --venv >/dev/null 2>&1 && pipenv --rm

# Install package in editable mode.
install:
	${PIPRUN} pip install -e . -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with specific optional dependencies. Valid options: docs, lint, test.
dev-%:
	${PIPRUN} pip install -e .[$*] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with all optional dependencies and pre-commit hoook when not in CI environment.
dev:
	${PIPRUN} pip install -e .[dev] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt
	-[ "${CI}" != "true" ] && pre-commit install --hook-type pre-push

# Show version.
version:
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

# Trigger test.
test:
	${PIPRUN} python -m pytest --cov=${SRCDIR} --cov-fail-under=$(or $(SS_TEST_COVERAGE_THRESHOLD),0) .

# Build package.
build:
	${PIPRUN} python -m build

# Upload package.
upload:
	${PIPRUN} python -m twine upload dist/*

# Generate docs.
docs:
	${PIPRUN} python -m sphinx.cmd.build docs docs/_build

# Auto build docs.
docs-autobuild:
	${PIPRUN} python -m sphinx_autobuild docs docs/_build
