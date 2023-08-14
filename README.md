# Serious Scaffold Python

A development-focused Python project template with various integrations, configurations and modules.

[![CI Status](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml)
[![codecov](https://codecov.io/gh/serious-scaffold/serious-scaffold-python/branch/main/graph/badge.svg?token=4JPKXI122N)](https://codecov.io/gh/serious-scaffold/serious-scaffold-python)
[![Documentation Status](https://readthedocs.org/projects/serious-scaffold-python/badge/)](https://serious-scaffold-python.readthedocs.io/)
[![GitHub](https://img.shields.io/github/license/serious-scaffold/serious-scaffold-python)](https://github.com/serious-scaffold/serious-scaffold-python/blob/main/LICENSE)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![PyPI](https://img.shields.io/pypi/v/serious-scaffold)](https://pypi.org/project/serious-scaffold/)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Pydantic v2](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/pydantic/pydantic/5697b1e4c4a9790ece607654e6c02a160620c7e1/docs/badge/v2.json)](https://pydantic.dev)
[![Serious Scaffold Python](https://img.shields.io/badge/serious%20scaffold-python-blue)](https://github.com/serious-scaffold/serious-scaffold-python)

[![Serious Scaffold Python](docs/_static/images/logo.svg)](https://github.com/serious-scaffold/serious-scaffold-python)

Project setup often involves more than just creating a basic project structure. It includes tasks like setting up GitHub Actions or GitLab CI/CD, configuring linters, tests and documentation, and implementing settings and logging modules. If you are tired of this repetitive process, [Serious Scaffold Python](https://github.com/serious-scaffold/serious-scaffold-python) is here to help. Utilizing the power of [`copier`](https://copier.readthedocs.io/), you can generate a new Python project with just one command. Simply answer a few questions, and your project will be fully set up. Additionally, your project can be updated alongside the advancement of the template.

If you find this helpful, please consider [sponsorship](https://github.com/sponsors/huxuan).

## 🛠 Features

- **Template Rendering**
  - Harness [`copier`](https://copier.readthedocs.io/) to initiate projects and enable template updates.
- **Environment Management**
  - Utilize [`pipenv`](https://pipenv.pypa.io/) for virtual environment management.
  - Use containers and system-level `pip` for CI/CD.
- **Dependency Management**
  - Manage dependencies categorically with [constraints](https://pip.pypa.io/en/stable/user_guide/#constraints-files) for different environments.
- **Code Quality Checks**
  - Incorporate linters including [`black`](https://github.com/psf/black), [`isort`](https://pycqa.github.io/isort/), [`mypy`](http://www.mypy-lang.org/), [`ruff`](https://github.com/charliermarsh/ruff), and [`toml-sort`](https://github.com/pappasam/toml-sort).
  - Integrate [`pre-commit`](https://github.com/pre-commit/pre-commit) for Git hooks automation.
- **Tests**
  - Execute tests with [`pytest`](https://pytest.org/), supplemented by [`coverage`](https://coverage.readthedocs.io) reports and thresholds.
- **Documentation**
  - Use [`sphinx`](https://www.sphinx-doc.org/) with the [`furo`](https://pradyunsg.me/furo) theme.
  - Include [MyPy](https://mypy.readthedocs.io/en/stable/command_line.html?report-generation) and [Coverage](https://coverage.readthedocs.io/en/7.3.0/cmd.html#html-reporting-coverage-html) reports.
- **Continuous Integration**
  - Offer a unified `Makefile` for common actions.
  - Provide configurations for [GitHub Actions](https://docs.github.com/actions) and [GitLab CI/CD](https://docs.gitlab.com/ee/ci/).
  - Support [Read the Docs](https://readthedocs.org/) integration.
- **Common Modules**
  - Use [`typer`](https://typer.tiangolo.com/) for CLI tasks, including tests, documentation, and configuration.
  - Adopt [`setuptools-scm`](https://github.com/pypa/setuptools_scm/) for versioning via git metadata.
  - Implement [`pydantic-settings`](https://docs.pydantic.dev/latest/usage/pydantic_settings/) for robust settings management.
- **Miscellaneous**
  - Offer VSCode [settings](.vscode/settings.json) and recommended [extensions](.vscode/extensions.json).

## 🔧 Prerequisites

Certain system-level Python applications are needed and it is recommended to use [`pipx`](https://pypa.github.io/pipx/) to install and run them in isolated environments. Refer to pipx's installation instructions [here](https://pypa.github.io/pipx/installation/). Once `pipx` is set up, install the necessary tools using the following commands.

```bash
# Copier: Template rendering for projects.
pipx install copier

# Pipenv: Virtual environment and package manager for Python.
pipx install pipenv

# Pre-commit: Automates Git hooks for code quality checks.
pipx install pre-commit
```

## 🚀 Quickstart

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

1. Commit the initialized project.

   ```bash
   git add .
   git commit -m "Init from serious-scaffold-python."
   ```

1. Initialization Done! Focus on the logical code within `src` folder now.

## 📜 License

MIT, for more details, see the [LICENSE](LICENSE) file.
