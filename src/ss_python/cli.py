"""Command Line Interface."""

import click


@click.group()
def cli() -> None:
    """CLI for Serious Scaffold Python."""


@cli.command()
def run() -> None:
    """Run command."""
