# -*- coding: utf-8 -*-
"""Command Line Interface."""
import click

CONTEXT_SETTINGS = {
    "help_option_names": ["-h", "--help"],
    "show_default": True,
}


@click.group(context_settings=CONTEXT_SETTINGS)
@click.version_option()
def cli() -> None:
    """Command Line Interface."""


@cli.command()
def run() -> None:
    """Run command."""
