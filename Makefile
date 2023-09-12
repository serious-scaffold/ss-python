.PHONY: clean deepclean install dev constraints black isort mypy ruff toml-sort lint pre-commit test-run test build upload docs-autobuild changelog docs-gen docs-mypy docs-coverage docs

########################################################################################
# Variables
########################################################################################

# Determine whether to invoke pipenv based on CI environment variable and the availability of pipenv.
PIPENV_RUN := $(shell [ "$$CI" != "true" ] && command -v pipenv > /dev/null 2>&1 && echo "pipenv run")

# Get the Python version in `major.minor` format, using the environment variable or the virtual environment if exists.
PYTHON_VERSION := $(shell echo $$PYTHON_VERSION 2>/dev/null || $(PIPENV_RUN) python -V 2>&1 | cut -d ' ' -f 2 | cut -d '.' -f 1,2)

# Finalize the invocation of the potential existed virtual environment.
VENV_RUN = $(and $(PIPENV_RUN),$(shell echo "pipenv run --python $(PYTHON_VERSION)"))

# Determine the constraints file based on the Python version.
CONSTRAINTS_FILE := constraints/$(PYTHON_VERSION).txt

# Documentation target directory, will be adapted to specific folder for readthedocs.
PUBLIC_DIR := $(shell [ "$$READTHEDOCS" = "True" ] && echo "$$READTHEDOCS_OUTPUT/html" || echo "public")

# URL and Path of changelog source code.
CHANGELOG_URL := https://serious-scaffold.github.io/serious-scaffold-python/_sources/changelog.md.txt
CHANGELOG_PATH := docs/changelog.md

########################################################################################
# Development Environment Management
########################################################################################

# Remove common intermediate files.
clean:
	-rm -rf \
		$(PUBLIC_DIR) \
		.copier-answers.yml \
		.coverage \
		.mypy_cache \
		.pytest_cache \
		.ruff_cache \
		Pipfile* \
		coverage.xml \
		dist
	find . -name '*.egg-info' -print0 | xargs -0 rm -rf
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -f
	find . -name '__pycache__' -print0 | xargs -0 rm -rf

# Remove pre-commit hook, virtual environment alongside itermediate files.
deepclean: clean
	if command -v pre-commit > /dev/null 2>&1; then pre-commit uninstall --hook-type pre-push; fi
	if command -v pipenv >/dev/null 2>&1 && pipenv --venv >/dev/null 2>&1; then pipenv --rm; fi

# Install the package in editable mode.
install:
	$(VENV_RUN) pip install -e . -c $(CONSTRAINTS_FILE)

# Install the package in editable mode with specific optional dependencies.
dev-%:
	$(VENV_RUN) pip install -e .[$*] -c $(CONSTRAINTS_FILE)

# Prepare the development environment.
# Install the pacakge in editable mode with all optional dependencies and pre-commit hoook.
dev:
	$(VENV_RUN) pip install -e .[docs,lint,package,test] -c $(CONSTRAINTS_FILE)
	if [ "$(CI)" != "true" ] && command -v pre-commit > /dev/null 2>&1; then pre-commit install --hook-type pre-push; fi

# Generate constraints for current Python version.
constraints: deepclean
	$(VENV_RUN) --python $(PYTHON_VERSION) pip install --upgrade -e .[docs,lint,package,test]
	$(VENV_RUN) pip freeze --exclude-editable > $(CONSTRAINTS_FILE)

########################################################################################
# Lint and pre-commit
########################################################################################

# Check lint with black.
black:
	$(VENV_RUN) python -m black --check .

# Check lint with isort.
isort:
	$(VENV_RUN) python -m isort --check .

# Check lint with mypy.
mypy:
	$(VENV_RUN) python -m mypy .

# Check lint with ruff.
ruff:
	$(VENV_RUN) python -m ruff .

# Check lint with toml-sort.
toml-sort:
	$(VENV_RUN) toml-sort --check pyproject.toml

# Check lint with all linters.
lint: black isort mypy ruff toml-sort

# Run pre-commit with autofix against all files.
pre-commit:
	pre-commit run --all-files

########################################################################################
# Test
########################################################################################

# Clean and run test with coverage.
test-run:
	$(VENV_RUN) python -m coverage erase
	$(VENV_RUN) python -m coverage run -m pytest

# Generate coverage report for terminal and xml.
test: test-run
	$(VENV_RUN) python -m coverage report
	$(VENV_RUN) python -m coverage xml

########################################################################################
# Package
########################################################################################

# Build the package.
build:
	$(VENV_RUN) python -m build

# Upload the package.
upload:
	$(VENV_RUN) python -m twine upload dist/*

########################################################################################
# Documentation
########################################################################################

# Generate documentation with auto build when changes happen.
docs-autobuild:
	$(VENV_RUN) python -m sphinx_autobuild docs $(PUBLIC_DIR) \
		--watch README.md \
		--watch src

# Generate changelog from git commits.
# NOTE(xuan.hu): Need to be run before document generation to take effect.
changelog:
	@if wget -q --spider $(CHANGELOG_URL); then \
		echo "Existing Changelog found at '$(CHANGELOG_URL)', download for incremental generation."; \
		wget -q -O $(CHANGELOG_PATH) $(CHANGELOG_URL); \
	fi
	$(VENV_RUN) git-changelog -ETrio docs/changelog.md -c conventional -s build,chore,ci,docs,feat,fix,perf,refactor,revert,style,test

# Build documentation only from src.
docs-gen:
	$(VENV_RUN) python -m sphinx.cmd.build docs $(PUBLIC_DIR)

# Generate mypy reports.
docs-mypy: docs-gen
	$(VENV_RUN) python -m mypy src test --html-report $(PUBLIC_DIR)/reports/mypy

# Generate html coverage reports with badge.
docs-coverage: test-run docs-gen
	$(VENV_RUN) python -m coverage html -d $(PUBLIC_DIR)/reports/coverage
	$(VENV_RUN) bash scripts/generate-coverage-badge.sh $(PUBLIC_DIR)/reports/coverage

# Generate all documentation with reports.
docs: changelog docs-gen docs-mypy docs-coverage

########################################################################################
# End
########################################################################################
