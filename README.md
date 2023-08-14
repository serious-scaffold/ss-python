# Serious Scaffold Python

A development-focused Python project template with various integrations, configurations and modules.

[![GitHub](https://img.shields.io/github/license/serious-scaffold/serious-scaffold-python)](https://github.com/serious-scaffold/serious-scaffold-python/blob/main/LICENSE)
[![CI Status](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/serious-scaffold/serious-scaffold-python/branch/main/graph/badge.svg?token=4JPKXI122N)](https://codecov.io/gh/serious-scaffold/serious-scaffold-python)
[![Documentation Status](https://readthedocs.org/projects/serious-scaffold-python/badge/)](https://serious-scaffold-python.readthedocs.io/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Pydantic v2](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/pydantic/pydantic/5697b1e4c4a9790ece607654e6c02a160620c7e1/docs/badge/v2.json)](https://pydantic.dev)
[![Serious Scaffold Python](https://img.shields.io/badge/serious%20scaffold-python-blue)](https://github.com/serious-scaffold/serious-scaffold-python)
[![PyPI](https://img.shields.io/pypi/v/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/serious-scaffold)](https://pypi.org/project/serious-scaffold/)

<div align="center">
  <a href="https://github.com/serious-scaffold/serious-scaffold-python">
    <img src="docs/_static/images/logo.svg" height=300 alt="Serious Scaffold Python">
  </a>
</div>

In daily work, project setup involves more than just creating a basic project structure. It often includes many repetitive tasks, such as setting up GitHub Actions or GitLab CI/CD, configuring linters, tests and documentation, as well as implementing settings and logging modules. If you are tired of this tiresome process, [Serious Scaffold Python](https://github.com/serious-scaffold/serious-scaffold-python) is here to help. Utilizing the power of [`copier`](https://copier.readthedocs.io/), you can generate a new Python project with just one command. Simply answer a few questions and your project is fully set up. Additionally, your project can be updated alongside the advancement of the template.

If you find this helpful, please consider [sponsorship](https://github.com/sponsors/huxuan).

## Features

- Basic Python project structure as a package.
- `Makefile` as the entry point for common actions.
- Lint with [`black`](https://github.com/psf/black), [`isort`](https://pycqa.github.io/isort/), [`mypy`](http://www.mypy-lang.org/), [`ruff`](https://github.com/charliermarsh/ruff), [`toml-sort`](https://github.com/pappasam/toml-sort) and [`pre-commit`](https://github.com/pre-commit/pre-commit) with [general hooks](https://github.com/pre-commit/pre-commit-hooks).
- Test with [`pytest`](https://pytest.org/) and [`coverage`](https://coverage.readthedocs.io) report and threshold.
- Documentation with [`sphinx`](https://www.sphinx-doc.org/) and [`furo`](https://pradyunsg.me/furo) with mypy and coverage reports.
- Categorized dependency management with [constraints](https://pip.pypa.io/en/stable/user_guide/#constraints-files) for different environments.
- [`typer`](https://typer.tiangolo.com/) for CLI development with tests and documentation and project configuration.
- [`pydantic-settings`](https://docs.pydantic.dev/latest/usage/pydantic_settings/) for settings management with tests and documentation.
- [`setuptools-scm`](https://github.com/pypa/setuptools_scm/) to automatic version extraction from git metadata.
- VSCode settings with recommended extensions.
- GitHub Actions or GitLab CI/CD for lint, tests, package and documentation automation.
- Readthedocs integration.

## Prerequisites

Some system-level Python tools need to be installed and it is highly recommended to use [`pipx`](https://pypa.github.io/pipx/) to manage them.

The installation of pipx can be referred [here](https://pypa.github.io/pipx/installation/) and then you can install all the required tools with the following commands.

```bash
pipx install copier # Project templates renderer.
pipx install pipenv # Python virtual environment management tool.
pipx install pre-commit # Git hooks package management tool.
```

## Quickstart

1. Generate the project by answering several questions.

   ```bash
   copier copy gh:serious-scaffold/serious-scaffold-python /path/to/project
   ```

1. Initialize an empty git repository.

   ```bash
   cd /path/to/project
   git init
   ```

1. Prepare development environment.

   ```bash
   make dev
   ```

1. Submit the first commit.

   ```bash
   git add .
   git commit -m "Init from serious-scaffold-python."
   ```

1. Happy hacking.

## Roadmap

Please refer to [Issues](https://github.com/serious-scaffold/serious-scaffold-python/issues)

## License

MIT

## Contributing

Any suggestions, discussions and bug fixing are all welcome.
