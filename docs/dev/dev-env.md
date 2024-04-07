# Development Environment

This page shows the approach to manage development environment. To simplify the process, a unified `Makefile` is maintained at the root directory of the repo. In other words, all the `make` related commands are supposed to run there.

## Prerequisites

After generating the project via `copier`, several necessary tools can be installed with the following commands.

```{note}
Using `pipx` for management is recommended and you can find pipx's installation instructions [here](https://pypa.github.io/pipx/installation/).
```

```bash
# PDM: A modern Python package and dependency manager supporting the latest PEP standards.
pipx install pdm==2.13.2
# Pre-commit: Automates Git hooks for code quality checks.
pipx install pre-commit==3.7.0
```

## Setup

Development environment can be setup with the following command:

```bash
make dev
```

This command will accomplish the following tasks:

- Create a virtual environment.
- Install all the dependencies, including those for documentation, lint, package and test.
- Install the project in editable mode.
- Install git hook scripts for `pre-commit`.

To speed up the setup process in certain scenarios, you may find <project:#partial-setup> helpful.

## Cleanup

When encountering environment-related problems. A straightforward solution is to cleanup the environment and setup a new one. Three different levels of cleanup approach are provided here.

### Intermediate cleanup

Intermediate cleanup only removes common intermediate files, such as generated documentation, package, coverage report, cache files for mypy, pytest, ruff and so on.

```bash
make clean
```

### Deep cleanup

Deep cleanup removes the pre-commit hook and the virtual environment alongside the common intermediate files.

```bash
make deepclean
```

### Complete cleanup

Complete cleanup restores the repository to its original, freshly-cloned state, ideal for starting over from scratch.

```{caution}
This will remove all untracked files, please use it with caution. It is recommended to check with dry-run mode (`git clean -dfnx`) before actually removing anything. For more information, please refer to the [git-clean documentation](https://git-scm.com/docs/git-clean).
```

```bash
git clean -dfx
```

## Partial Setup

In certain cases, it is unnecessary to install all dependencies as well as the pre-commit hook. For example, speed up the setup process in CI/CD.

### Minimal installation

Install the project in editable mode only with necessary dependencies, useful for scenarios like deployment.

```bash
make install
```

### Documentation generation

Install the project in editable mode with `doc` related dependencies,
recommended for scenarios like documentation generation CI/CD process.

```bash
make dev-doc
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

### Testing

Install the project in editable mode with `test` related dependencies,
recommended for scenarios like test CI/CD process.

```bash
make dev-test
```

````{admonition} Install a combination of the optional dependencies
:class: tip, dropdown
For example, to install dependencies for `doc` and `lint`, we can use the following command.

```bash
make dev-doc,lint
```
````
