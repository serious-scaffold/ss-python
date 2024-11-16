"""Command Line Interface."""

import click


@click.group()
def cli() -> None:
    """Command Line Interface."""


@cli.command()
def run() -> None:
    """Run command."""
