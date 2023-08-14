.PHONY: clean deepclean install dev version pre-commit lint black mypy ruff toml-sort tests freeze build upload docs docs-autobuild reports

PIPRUN := $(shell if [ "${CI}" != "true" ] && command -v pipenv > /dev/null 2>&1; then echo "pipenv run"; fi)
PUBLIC_DIR := $(if $(READTHEDOCS_OUTPUT),$(READTHEDOCS_OUTPUT)/html,public)

# Remove common intermediate files.
clean:
	-rm -rf \
		.copier-answers.yml \
		.coverage \
		.mypy_cache \
		.pytest_cache \
		.ruff_cache \
		Pipfile* \
		coverage.xml \
		dist \
		$(PUBLIC_DIR)
	find . -name '*.egg-info' -print0 | xargs -0 rm -rf
	find . -name '*.pyc' -print0 | xargs -0 rm -f
	find . -name '*.swp' -print0 | xargs -0 rm -f
	find . -name '.DS_Store' -print0 | xargs -0 rm -f
	find . -name '__pycache__' -print0 | xargs -0 rm -rf

deepclean: clean
	if command -v pre-commit > /dev/null 2>&1; then pre-commit uninstall --hook-type pre-push; fi
	if command -v pipenv >/dev/null 2>&1 && pipenv --venv >/dev/null 2>&1; then pipenv --rm; fi

install:
	${PIPRUN} pip install -e . -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

dev-%:
	${PIPRUN} pip install -e .[$*] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt

dev:
	${PIPRUN} pip install -e .[docs,lint,package,tests] -c constraints/$(or $(SS_CONSTRAINTS_VERSION),default).txt
	if [ "${CI}" != "true" ] && command -v pre-commit > /dev/null 2>&1; then pre-commit install --hook-type pre-push; fi

version:
	${PIPRUN} python -m setuptools_scm

pre-commit:
	pre-commit run --all-files

black:
	${PIPRUN} python -m black docs tests src

lint: isort mypy ruff toml-sort

isort:
	${PIPRUN} python -m isort .

mypy:
	${PIPRUN} python -m mypy docs tests src

ruff:
	${PIPRUN} python -m ruff docs tests src

toml-sort:
	${PIPRUN} toml-sort pyproject.toml

tests:
	${PIPRUN} python -m coverage erase
	${PIPRUN} python -m coverage run -m pytest
	${PIPRUN} python -m coverage report

freeze:
	@${PIPRUN} pip freeze --exclude-editable

build:
	${PIPRUN} python -m build

upload:
	${PIPRUN} python -m twine upload dist/*

docs:
	${PIPRUN} python -m sphinx.cmd.build docs ${PUBLIC_DIR}

docs-autobuild:
	${PIPRUN} python -m sphinx_autobuild docs ${PUBLIC_DIR} --watch src

reports:
	${PIPRUN} python -m mypy tests src --html-report ${PUBLIC_DIR}/reports/mypy
	${PIPRUN} python -m coverage erase
	${PIPRUN} python -m coverage run -m pytest
	${PIPRUN} python -m coverage html -d ${PUBLIC_DIR}/reports/coverage
