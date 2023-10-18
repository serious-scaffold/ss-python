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
- Install the project in editable mode with the requirements for documentation, lint, package and test.
- Install Git hooks for various kinds of check at `pre-push` stage.

## Environment Cleanup

In daily development, especially when we need to upgrade or add new dependencies, we tend to encounter environment related problem. A straightforward solution is cleanup the current environment and setup a new one with command like `make dev`. Three different levels of cleanup approach are recommended here.

### Intermediate cleanup

This command will only remove common intermediate files, such as generated documentation, package, coverage report, cache files for mypy, pytest, ruff and so on.

```bash
make clean
```

### Deep cleanup

This command will remove the pre-commit hook and the virtual environment if created alongside the common intermediate files.

```bash
make deepclean
```

### Complete cleanup

With this command, the repo will be as if it has been re-cloned. It is useful if we want to start almost from scratch.

```{caution}
This will remove all untracked files, please use it with caution. It is recommended to check with dry-run mode (`git clean -dfnx`) before actually removing anything. For more information, please refer to the [git-clean documentation](https://git-scm.com/docs/git-clean).
```

```bash
git clean -dfx
```

## Partial environment setup

In certain cases, it is unnecessary to install all requirements as well as the pre-commit hook.
Then we can benefit from the following partial environment setup, for example, it will reduce the time of running corresponding CI/CD.

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

### Test

Install the project in editable mode with `test` related dependencies,
recommended for scenarios like test CI/CD process.

```bash
make dev-test
```

```{tip}
We can also install a combination of the optional dependencies. For example, using `make dev-docs,lint` to install requirements for `docs` and `lint`.
```
