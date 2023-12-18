.PHONY: clean deepclean install dev mypy ruff ruff-format toml-sort lint pre-commit test-run test build publish docs-autobuild changelog docs-gen docs-mypy docs-coverage docs

########################################################################################
# Variables
########################################################################################

# Get the Python version in `major.minor` format, using the environment variable or the virtual environment if exists.
PYTHON_VERSION := $(shell echo $${PYTHON_VERSION:-$$(python -V 2>&1 | cut -d ' ' -f 2)} | cut -d '.' -f 1,2)

# Documentation target directory, will be adapted to specific folder for readthedocs.
PUBLIC_DIR := $(shell [ "$$READTHEDOCS" = "True" ] && echo "$$READTHEDOCS_OUTPUT/html" || echo "public")

# URL and Path of changelog source code.
CHANGELOG_URL := $(shell echo $${CI_PAGES_URL:-https://serious-scaffold.github.io/ss-python}/_sources/changelog.md.txt)
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
		build \
		coverage.xml \
		dist \
		release-notes.md
	find . -name '*.egg-info' -print0 | xargs -0 rm -rf
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -f
	find . -name '__pycache__' -print0 | xargs -0 rm -rf

# Remove pre-commit hook, virtual environment alongside itermediate files.
deepclean: clean
	if command -v pre-commit > /dev/null 2>&1; then pre-commit uninstall --hook-type pre-push; fi
	if command -v pdm >/dev/null 2>&1 && pdm venv list | grep -q in-project ; then pdm venv remove --yes in-project >/dev/null 2>&1; fi

# Install the package in editable mode.
install:
	pdm install --prod

# Install the package in editable mode with specific optional dependencies.
dev-%:
	pdm install --group [$*]

# Prepare the development environment.
# Install the pacakge in editable mode with all optional dependencies and pre-commit hoook.
dev:
	pdm install
	if [ "$(CI)" != "true" ] && command -v pre-commit > /dev/null 2>&1; then pre-commit install --hook-type pre-push; fi

########################################################################################
# Lint and pre-commit
########################################################################################

# Check lint with mypy.
mypy:
	pdm run python -m mypy .

# Lint with ruff.
ruff:
	pdm run python -m ruff check .

# Format with ruff.
ruff-format:
	pdm run python -m ruff format --check .

# Check lint with toml-sort.
toml-sort:
	pdm run toml-sort --check pyproject.toml

# Check lint with all linters.
lint: mypy ruff ruff-format toml-sort

# Run pre-commit with autofix against all files.
pre-commit:
	pre-commit run --all-files

########################################################################################
# Test
########################################################################################

# Clean and run test with coverage.
test-run:
	pdm run python -m coverage erase
	pdm run python -m coverage run -m pytest

# Generate coverage report for terminal and xml.
test: test-run
	pdm run python -m coverage report
	pdm run python -m coverage xml

########################################################################################
# Package
########################################################################################

# Build the package.
build:
	pdm build

# Publish the package.
publish:
	pdm publish

########################################################################################
# Documentation
########################################################################################

# Generate documentation with auto build when changes happen.
docs-autobuild:
	pdm run python -m sphinx_autobuild docs $(PUBLIC_DIR) \
		--watch README.md \
		--watch src

# Generate changelog from git commits.
# NOTE(xuan.hu): Need to be run before document generation to take effect.
changelog:
	@if wget -q --spider $(CHANGELOG_URL); then \
		echo "Existing Changelog found at '$(CHANGELOG_URL)', download for incremental generation."; \
		wget -q -O $(CHANGELOG_PATH) $(CHANGELOG_URL); \
	fi
	pdm run git-changelog -ETrio $(CHANGELOG_PATH) -c conventional -s build,chore,ci,docs,feat,fix,perf,refactor,revert,style,test

# Generate release notes from changelog.
release-notes:
	pdm run git-changelog --input $(CHANGELOG_PATH) --release-notes

# Build documentation only from src.
docs-gen:
	pdm run python -m sphinx.cmd.build docs $(PUBLIC_DIR)

# Generate mypy reports.
docs-mypy: docs-gen
	pdm run python -m mypy src test --html-report $(PUBLIC_DIR)/reports/mypy

# Generate html coverage reports with badge.
docs-coverage: test-run docs-gen
	pdm run python -m coverage html -d $(PUBLIC_DIR)/reports/coverage
	pdm run bash scripts/generate-coverage-badge.sh $(PUBLIC_DIR)/_static/badges

# Generate all documentation with reports.
docs: changelog docs-gen docs-mypy docs-coverage

########################################################################################
# End
########################################################################################
