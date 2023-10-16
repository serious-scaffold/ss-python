# Environment management

## Perquisites

After generating the project via `copier`, several necessary tools can be installed with the following commands.
Note that, it is recommended to use `pipx` to manage them and you can find pipx's installation instructions [here](https://pypa.github.io/pipx/installation/).

```bash
# Pipenv: Virtual environment and package manager for Python.
pipx install pipenv
# Pre-commit: Automates Git hooks for code quality checks.
pipx install pre-commit
```

## Environment setup

There is a all-in-one command to setup environment for daily development.

```bash
make dev
```

This command will accomplish the following tasks:

- Create a virtual environment if applicable (when `pipenv` is available and not in CI environment).
- Install the project in editable mode also with the requirements for documentation, lint, package and test.
- Install pre-push Git hooks for various kinds of check.

## Environment Cleanup

In daily development, especially when we need to upgrade or add new dependencies, we tend to encounter environment related problem. A straightforward solution is cleanup the current environment and setup a new one. Three different levels of cleanup approach are recommended here.

### Intermediate cleanup

This command will only remove common intermediate files, such as generated documentation, package, coverage report, cache files for mypy, pytest, ruff and so on.
It is useful for scenarios like generating documentation or running lint or test that want to have no cache remained.

```bash
make clean
```

### Deep cleanup

This command will remove the pre-commit hook and the virtual environment if created alongside the common intermediate files. It is useful for environment reconstruction, so it is usually used with `make dev`.

```bash
make deepclean
```

### Complete cleanup

With this command, the repo will be as if it has been re-cloned. It is useful if we want to start almost from scratch.

```{caution}
This will remove all untracked files. Only changes to tracked files will be remained.
```

```bash
git clean -xdf
```

## Partial environment setup

In certain cases, we do not need to install all the requirements, and
virtual environment and pre-commit hook are also not necessary.
In this way, we can benefit from the following environment setup commands.

### Minimal Installation

Install the project in editable mode with no extra dependency,
recommended for deployment scenario that only need minimal installation.

```bash
make install
```

### Documentation generation

Install the project in editable mode with `docs` related dependencies,
recommended for scenarios like documentation generation CI/CD process.

```bash
make dev-docs
```

### Lint check

Install the project in editable mode with `lint` related dependencies,
recommended for scenarios like lint CI/CD process.

```bash
make dev-lint
```

### Package build

Install the project in editable mode with `package` related dependencies,
recommended for scenarios like package CI/CD process.

```bash
make dev-package
```

### Unit Test

Install the project in editable mode with `test` related dependencies,
recommended for scenarios like test CI/CD process.

```bash
make dev-test
```
