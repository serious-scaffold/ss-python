.PHONY: clean deepclean install dev version pre-commit lint black mypy ruff toml-sort test freeze build upload docs docs-autobuild

# Construct pipenv run command with or without site-packages flag when not in CI environment and pipenv command exists.
SITE_PACKAGES_FLAG = $(shell [ "${SS_SITE_PACKAGES}" = "true" ] && echo --site-packages)
PIPRUN := $(shell [ "${CI}" != "true" ] && command -v pipenv > /dev/null 2>&1 && echo pipenv ${SITE_PACKAGES_FLAG} run)
SRCDIR := src

# Remove common intermediate files.
clean:
	-rm -rf \
		*.egg-info \
		.coverage \
		.mypy_cache \
		.pytest_cache \
		.ruff_cache \
		Pipfile* \
		coverage.xml \
		dist \
		docs\_build
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -rf
	find . -name '__pycache__' -print0 | xargs -0 rm -rf

# Remove common intermediate files alongside with `pre-commit` hook and virtualenv created by `pipenv`.
deepclean: clean
	-pre-commit uninstall --hook-type pre-push
	-pipenv --venv >/dev/null 2>&1 && pipenv --rm

# Install package in editable mode.
install:
	${PIPRUN} pip install -e . -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with specific optional dependencies. Valid options: docs, lint, package, test.
dev-%:
	${PIPRUN} pip install -e .[$*] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

# Install package in editable mode with all optional dependencies and pre-commit hoook when not in CI environment.
dev:
	${PIPRUN} pip install -e .[docs,lint,package,test] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt
	-[ "${CI}" != "true" ] && pre-commit install --hook-type pre-push

# Show version.
version:
	${PIPRUN} python -m setuptools_scm

# Run pre-commit for all files.
pre-commit:
	pre-commit run --all-files

# All linters.
lint: mypy ruff toml-sort

# Code formatter.
black:
	${PIPRUN} python -m black tests ${SRCDIR}

# Static type checker.
mypy:
	${PIPRUN} python -m mypy tests ${SRCDIR}

# Python linter.
ruff:
	${PIPRUN} python -m ruff ${SRCDIR}

# Sort and format toml files.
toml-sort:
	${PIPRUN} toml-sort -a -i pyproject.toml

# Trigger test.
test:
	${PIPRUN} python -m pytest --cov=${SRCDIR} --cov-fail-under=$(or $(SS_TEST_COVERAGE_THRESHOLD),0) .

# Freeze constraints.
freeze:
	@${PIPRUN} pip freeze --exclude-editable

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
