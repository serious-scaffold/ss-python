# Set Up Development Environment

This page shows the approach to set up development environment. To simplify the process, a unified `Makefile` is maintained at the root directory of the repo. In other words, all the `make` related commands are supposed to run there.

## Prerequisites

Several necessary tools need to be installed with the following commands:

```{note}
Using `pipx` for management is recommended and you can find pipx's installation instructions [here](https://pypa.github.io/pipx/installation/).
```

```bash
# PDM: A modern Python package and dependency manager supporting the latest PEP standards.
pipx install pdm==2.15.2
# Pre-commit: Automates Git hooks for code quality checks.
pipx install pre-commit==3.7.1
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

To speed up the setup process in certain scenarios, you may find <project:../advanced/partial-dev-env.md> helpful.
