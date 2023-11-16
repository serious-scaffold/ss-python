"""Command Line Interface."""
import typer

app = typer.Typer()


@app.command()
def run() -> None:
    """Run command."""


# NOTE(huxuan): callback is required for single command as a subcommand in typer.
# And it is a convenient way to document the cli here.
# Reference: https://typer.tiangolo.com/tutorial/commands/one-or-multiple/#one-command-and-one-callback
# BTW, `no_args_is_help` is set to `True` to avoid error when invoking the cli with no
# subcommands. The default behavior is strange and might change in the future.
# Reference: https://github.com/tiangolo/typer/issues/328
@app.callback(no_args_is_help=True)
def main() -> None:
    """CLI for Serious Scaffold Python."""


# NOTE(huxuan): click object is used for document generation.
# Reference: https://github.com/tiangolo/typer/issues/200#issuecomment-796485787
typer_click_object = typer.main.get_command(app)
