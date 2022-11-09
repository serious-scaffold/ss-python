# -*- coding: utf-8 -*-
"""Configuration file for the Sphinx documentation builder.

For the full list of built-in configuration values, see the documentation:
https://www.sphinx-doc.org/en/master/usage/configuration.html
"""

from importlib import metadata

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "serious-scaffold"  # pylint: disable=invalid-name
package = project.replace("-", "_")  # pylint: disable=invalid-name
author = metadata.metadata(package)["Author"]
copyright = f"2022, {author}"  # pylint: disable=redefined-builtin
release = metadata.version(package)
version = ".".join(release.split(".")[:2])  # pylint: disable=invalid-name


# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.viewcode",
    "sphinx.ext.napoleon",
    "sphinx_click",
]

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "furo"  # pylint: disable=invalid-name
html_static_path = ["_static"]
