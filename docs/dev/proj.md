# Project Management

## Prerequisites

[`copier`](https://copier.readthedocs.io/) is a fundamental and distinct component for `serious-scaffold-python` compared with other project templates. Installation can be done with the following command.

```{note}
Using `pipx` for management is recommended and you can find pipx's installation instructions [here](https://pypa.github.io/pipx/installation/).
```

```bash
# Copier: Template rendering for projects.
pipx install copier
```

## Project Initialization

1. Create a Git repository on the hosting platform. Clone it to local and navigate to the root directory.

    ```{note}
    The repository url `git@git.example.com/demo_namespace/demo_name.git` is used for demonstration.
    ```

    ```bash
    git clone git@git.example.com/demo_namespace/demo_name.git
    cd demo_name
    ```

1. Generate the project.

    ```{note}
    Several questions will be asked here. Your patient is appreciated for the one-time job.
    ```

    ```bash
    copier copy gh:serious-scaffold/serious-scaffold-python .
    ```

1. Set up the development environment.

    ```bash
    make dev
    ```

1. Commit and push the initialized project.

    ```bash
    git add .
    git commit -m "chore: Initialize from serious-scaffold-python."
    SKIP=no-commit-to-branch git push
    ```

Now, everything is done for initialization.

## Project Configuration

Some notable recommended configuration are listed here since there exist too many detailed aspects. Feel free to adjust according to the actual requirements.

1.

## Project Update

Thanks to the update mechanism provided natively by `copier`, when a new version of the scaffold is released, you can easily update the project. Just run the following command under the root directory:

```bash
copier update
```

```{note}
Flag `-A/--skip-answered` can be used to skip questions that have already been answered.
```

In most cases, `copier` will manage updates seamlessly. If there are any conflicts, since everything is controlled by Git, we can theoretically take care of them manually.

```{tip}
To minimize potential conflicts, there are several suggestions to follow:
1. Do not modify the auto-generated files unless necessary.
1. For project related changes, it is advised to adopt inheritance or extension approach rather than overwrite.
1. For scaffold related changes, it is advised to propose a issue or change request to the scaffold directly.
```

For more details, check out `copier update --help` or refer to [the official documentation](https://copier.readthedocs.io/en/stable/updating/).
