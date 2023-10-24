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
    git push
    ```

Now, everything is done for initialization.

## Project Configuration

Some notable recommended configuration are listed since there exist many detailed aspects. Feel free

1.

## Project Update

Thanks to the update mechanism provided natively by `copier`, when a new version of the scaffold is released, we can just run the following command under the root directory to update the project.

```bash
copier update
```

Generally, `copier` will handle everything properly. If there are any conflicts, since everything is controlled by Git, we can theoretically take care of them manually. For further information, please refer to the official documentation of [copier update](https://copier.readthedocs.io/en/stable/updating/).

```{tip}
To avoid potential conflicts, we should avoid changing the generated files unless necessary.
```
