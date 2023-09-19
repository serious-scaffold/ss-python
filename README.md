# Serious Scaffold Python

A development-focused Python project template with various integrations, configurations and modules.

[![CI](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml/badge.svg)](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/ci.yml)
[![Release](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/release.yml/badge.svg)](https://github.com/serious-scaffold/serious-scaffold-python/actions/workflows/release.yml)
[![Coverage](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/serious-scaffold-python/_static/badges/coverage.json)](https://serious-scaffold.github.io/serious-scaffold-python/reports/coverage)
[![PyPI](https://img.shields.io/pypi/v/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![GitHub](https://img.shields.io/github/license/serious-scaffold/serious-scaffold-python)](https://github.com/serious-scaffold/serious-scaffold-python/blob/main/LICENSE)

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Imports: isort](https://img.shields.io/badge/%20imports-isort-%231674b1?style=flat&labelColor=ef8336)](https://pycqa.github.io/isort/)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Pydantic v2](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/pydantic/pydantic/5697b1e4c4a9790ece607654e6c02a160620c7e1/docs/badge/v2.json)](https://pydantic.dev)
[![Serious Scaffold Python](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/serious-scaffold-python/_static/badges/logo.json)](https://serious-scaffold.github.io/serious-scaffold-python)

[![Serious Scaffold Python](https://serious-scaffold.github.io/serious-scaffold-python/_static/images/logo.svg)](https://github.com/serious-scaffold/serious-scaffold-python)

Setting up a project often involves more than just establishing a basic project structure. It involves tasks like integrating GitHub Actions or GitLab CI/CD, configuring lint, test and documentation, as well as implementing settings, logging and other frequently used modules. [Serious Scaffold Python](https://github.com/serious-scaffold/serious-scaffold-python) streamlines this process. Powered by [`copier`](https://copier.readthedocs.io/), bootstrapping a new Python project can be done with a single command. By answering a few questions, the project will be fully configured and ready for development. Furthermore, the project can be updated alongside the advancement of the template.

If you find this helpful, please consider [sponsorship](https://github.com/sponsors/huxuan).

## 🛠️ Features

- Project setup and template update with [`copier`](https://copier.readthedocs.io/).
- Manage [virtual environments](https://docs.python.org/3/glossary.html#term-virtual-environment) for development with [`pipenv`](https://pipenv.pypa.io/).
- Manage dependency with categorized [requirements](https://pip.pypa.io/en/stable/user_guide/#requirements-files) and [constraints](https://pip.pypa.io/en/stable/user_guide/#constraints-files).
- Automate Git hooks with [pre-commit hooks](https://github.com/pre-commit/pre-commit-hooks) and [local](https://pre-commit.com/#repository-local-hooks) linters.
- Lint with [`black`](https://github.com/psf/black), [`isort`](https://pycqa.github.io/isort/), [`mypy`](http://www.mypy-lang.org/), [`ruff`](https://github.com/charliermarsh/ruff), and [`toml-sort`](https://github.com/pappasam/toml-sort).
- Test with [`pytest`](https://pytest.org/) and [`coverage`](https://coverage.readthedocs.io) for threshold and reports.
- Document with [`sphinx`](https://www.sphinx-doc.org/), the [`furo`](https://pradyunsg.me/furo) theme, and [mypy](https://mypy.readthedocs.io/en/stable/command_line.html?report-generation)/[coverage](https://coverage.readthedocs.io/en/7.3.0/cmd.html#html-reporting-coverage-html) reports.
- Version the package using git metadata with [`setuptools-scm`](https://github.com/pypa/setuptools_scm/).
- Continuous Integration with [GitHub Actions](https://docs.github.com/actions) and [GitLab CI/CD](https://docs.gitlab.com/ee/ci/).
- [Versioned documentation](https://docs.readthedocs.io/en/stable/versions.html) with [Read the Docs](https://readthedocs.org/) integration.
- Develop Command Line Interfaces with [`typer`](https://typer.tiangolo.com/).
- Manage configurations with [`pydantic-settings`](https://docs.pydantic.dev/latest/usage/pydantic_settings/).
- Centralize common actions with a unified Makefile.
- VSCode settings with recommended extensions.

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

1. Generate the project.

   ```bash
   copier copy gh:serious-scaffold/serious-scaffold-python /path/to/project
   ```

2. Navigate to the project directory and initialize a git repository.

   ```bash
   cd /path/to/project
   git init
   ```

3. Set up the development environment.

   ```bash
   make dev
   ```

4. Commit the initialized project.

   ```bash
   git add .
   git commit -m "Initialize from serious-scaffold-python."
   ```

5. That's it! Feel free to focus on the coding within `src` folder.

## 🛡 Badge

Badge for markdown:

```markdown
[![Serious Scaffold Python](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/serious-scaffold-python/_static/badges/logo.json)](https://serious-scaffold.github.io/serious-scaffold-python)
```

Badge for restructuredtext:

```restructuredtext
.. image:: https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/serious-scaffold-python/_static/badges/logo.json
    :target: serious-scaffold.github.io/serious-scaffold-python
```

It will looks like this: [![Serious Scaffold Python](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/serious-scaffold-python/_static/badges/logo.json)](https://serious-scaffold.github.io/serious-scaffold-python)

## 📜 License

MIT, for more details, see the [LICENSE](https://github.com/serious-scaffold/serious-scaffold-python/blob/main/LICENSE) file.
