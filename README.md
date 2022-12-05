# Serious Scaffold Python

A serious Python project template for out-of-box and production usage.

[![Lint & Test Status](https://github.com/huxuan/serious-scaffold-python/actions/workflows/lint-test.yml/badge.svg?branch=main)](https://github.com/huxuan/serious-scaffold-python/actions/workflows/lint-test.yml)
[![Codecov](https://img.shields.io/codecov/c/github/huxuan/serious-scaffold-python)](https://app.codecov.io/gh/huxuan/serious-scaffold-python)
[![Read the Docs](https://img.shields.io/readthedocs/serious-scaffold-python)](https://serious-scaffold-python.readthedocs.io/)
[![PyPI](https://img.shields.io/pypi/v/serious-scaffold)](https://pypi.org/project/serious-scaffold/)
[![PyPI - License](https://img.shields.io/pypi/l/serious-scaffold)](https://github.com/huxuan/serious-scaffold-python/blob/main/LICENSE)
[![PyPI - Python Version](https://img.shields.io/pypi/pyversions/serious-scaffold)](https://pypi.org/project/serious-scaffold/)

<div align="center">
  <a href="https://github.com/huxuan/serious-scaffold-python">
    <img src="docs/_static/images/logo.png" height=300 alt="Serious Scaffold Python">
  </a>
</div>

Many efforts have been made to easier the project setup, but most of them are only language-specified basic components. In reality, we have to deal with much more details, especially for team projects. Many commonly used tools and configurations need to be handled properly. Not to mention that different people tend to have different favors on various aspects. [Serious Scaffold Python](https://github.com/huxuan/serious-scaffold-python) is a kind of abstraction from my Python development experience that aims to terminate the inefficient setup process and endless discussion for Python Projects.

If you find this helpful, please consider [sponsorship](https://github.com/huxuan/serious-scaffold-python).

## Features

- Basic Python project structure as a package with tests and documentation.
- Categorized requirements management with constraints for different environments.
- [`typer`](https://github.com/tiangolo/typer) for CLI with tests and automatic documentation generation.
- [`pydantic`](https://github.com/pydantic/pydantic) for [settings](https://pydantic-docs.helpmanual.io/usage/settings/) with tests and documentation as module samples.
- [`setuptools-scm`](https://github.com/pypa/setuptools_scm/) to extract the version for the package.
- [`black`](https://github.com/psf/black), [`mypy`](https://github.com/python/mypy), [`ruff`](https://github.com/charliermarsh/ruff) and [`toml-sort`](https://github.com/pappasam/toml-sort) as linters.
- [`pre-commit`](https://github.com/pre-commit/pre-commit) with [general hooks](https://github.com/pre-commit/pre-commit-hooks) and local linters.
- `Makefile` as the entry point for common actions.
- VSCode settings with recommended extensions.
- GitHub workflows for lint, test, package and documentation preview.

## Roadmap

- More detailed documentation for all aspects.
- [Cookiecutter](https://github.com/cookiecutter/cookiecutter) integration.
- [Gitlab CI/CD](https://docs.gitlab.com/ee/ci/) integration.

## License

MIT

## Contributing

Any suggestions, discussions and bug fixing are all welcome.
