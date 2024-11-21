# Serious Scaffold Python

A Python Project Template for Long-Term Maintainability.

[![CI](https://github.com/serious-scaffold/ss-python/actions/workflows/ci.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/ci.yml)
[![CommitLint](https://github.com/serious-scaffold/ss-python/actions/workflows/commitlint.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/commitlint.yml)
[![DevContainer](https://github.com/serious-scaffold/ss-python/actions/workflows/devcontainer.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/devcontainer.yml)
[![Release](https://github.com/serious-scaffold/ss-python/actions/workflows/release.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/release.yml)
[![Renovate](https://github.com/serious-scaffold/ss-python/actions/workflows/renovate.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/renovate.yml)
[![Semantic Release](https://github.com/serious-scaffold/ss-python/actions/workflows/semantic-release.yml/badge.svg)](https://github.com/serious-scaffold/ss-python/actions/workflows/semantic-release.yml)
[![Coverage](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/ss-python/_static/badges/coverage.json)](https://serious-scaffold.github.io/ss-python/reports/coverage)
[![Release](https://img.shields.io/github/v/release/serious-scaffold/ss-python)](https://github.com/serious-scaffold/ss-python/releases)
[![PyPI](https://img.shields.io/pypi/v/ss-python)](https://pypi.org/project/ss-python/)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/ss-python)](https://pypi.org/project/ss-python/)
[![GitHub](https://img.shields.io/github/license/serious-scaffold/ss-python)](https://github.com/serious-scaffold/ss-python/blob/main/LICENSE)

[![pdm-managed](https://img.shields.io/badge/pdm-managed-blueviolet)](https://pdm-project.org)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)
[![Checked with mypy](https://www.mypy-lang.org/static/mypy_badge.svg)](http://mypy-lang.org/)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)
[![Pydantic v2](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/pydantic/pydantic/5697b1e4c4a9790ece607654e6c02a160620c7e1/docs/badge/v2.json)](https://pydantic.dev)
[![Copier](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/copier-org/copier/master/img/badge/badge-grayscale-inverted-border-orange.json)](https://github.com/copier-org/copier)
[![Serious Scaffold Python](https://img.shields.io/endpoint?url=https://serious-scaffold.github.io/ss-python/_static/badges/logo.json)](https://serious-scaffold.github.io/ss-python)
[![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&message=Open&color=blue&logo=visualstudiocode)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/serious-scaffold/ss-python)

> [!WARNING]
> _Serious Scaffold Python_ is in the **Alpha** phase.
> Frequent changes and instability should be anticipated.
> Any feedback, comments, suggestions and contributions are welcome!

[![Serious Scaffold Python](https://serious-scaffold.github.io/ss-python/_static/images/logo.svg)](https://github.com/serious-scaffold/ss-python)

Serious Scaffold Python is crafted for long-term, maintainable Python projects. It includes GitHub Actions and GitLab CI/CD, automated dependency updates via Renovate, and comprehensive linting, testing, and documentation. Key integrations like pdm for environment and dependency management, click for CLI development, and pydantic for configuration enhance project robustness. With copier’s easy project setup and continuous updating, your project stays aligned with best practices for sustainable development. Pre-configured dev containers and cross-platform CI support ensure maintainability from the start.

If you find this helpful, please consider [sponsorship](https://github.com/sponsors/huxuan).

## 🛠️ Features

- Project setup and template update with [copier](https://copier.readthedocs.io/).
- Manage dependencies and virtual environments with [pdm](https://pdm-project.org/).
- Build with [setuptools](https://github.com/pypa/setuptools) and versioned with [setuptools-scm](https://github.com/pypa/setuptools_scm/).
- Lint with [pre-commit](https://pre-commit.com), [mypy](http://www.mypy-lang.org/), [ruff](https://github.com/charliermarsh/ruff), [pyproject-fmt](https://github.com/tox-dev/pyproject-fmt) and [commitlint](https://commitlint.js.org/).
- Test with [pytest](https://docs.pytest.org/) and [coverage](https://coverage.readthedocs.io) for threshold and reports.
- Documentation with [sphinx](https://www.sphinx-doc.org/), the [furo](https://pradyunsg.me/furo) theme and [MyST parser](https://myst-parser.readthedocs.io/) for markdown.
- Develop Command Line Interfaces with [click](https://click.palletsprojects.com/).
- Manage configurations with [pydantic-settings](https://docs.pydantic.dev/latest/usage/pydantic_settings/).
- [Dev container](https://containers.dev/) for development and GitLab CI/CD.
- Automate dependency updates with [Renovate](https://github.com/renovatebot/renovate).
- Automate version management and release with [semantic-release](https://github.com/semantic-release/semantic-release).
- [Versioned documentation](https://docs.readthedocs.io/en/stable/versions.html) and [pull request previews](https://docs.readthedocs.io/en/stable/pull-requests.html) with [Read the Docs](https://readthedocs.org/).
- Adapted configuration for GitHub, GitLab and self-managed GitLab.
- Continuous Integration for Linux, MacOS and Windows [GitHub Only].
- Continuous Integration for multiple Python versions.
- Release with documentation, package and production container.
- Centralize common actions with a unified Makefile.
- VSCode settings with recommended extensions.

## 🔧 Prerequisites

[pipx](https://pipx.pypa.io/) is required to manage the standalone tools used across the development lifecycle.
Please refer to pipx's installation instructions [here](https://pipx.pypa.io/stable/installation/).
Once pipx is set up, install the copier for project generation using the following command:

```bash
pipx install copier==9.4.1
```

## 🚀 Quickstart

1. Generate the project.

   ```bash
   copier copy gh:serious-scaffold/ss-python /path/to/project
   ```

1. Navigate to the project directory and initialize a git repository.

   ```bash
   cd /path/to/project
   git init
   ```

1. Install standalone tools.

   ```bash
   make prerequisites
   ```

1. Set up the development environment.

   ```bash
   make dev
   ```

1. Commit the initialized project.

   ```bash
   git add .
   git commit -m "Initialize from serious-scaffold."
   ```

1. That's it! Feel free to focus on the coding within `src` folder.

## 📜 License

MIT License, for more details, see the [LICENSE](https://github.com/serious-scaffold/ss-python/blob/main/LICENSE) file.
