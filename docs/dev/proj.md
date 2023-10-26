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

1. Require pull request or merge request before merging to the default branch.
1. Require passing CI/CD before merging to the default branch.
1. Require squash merging and use pull request or merge request title as commit message.
1. Only maintainers can create tags match `v*` pattern, e.g., `v1.2.3`.
1. Make sure Linux-based CI/CD runner(s) is available.
1. Make sure the following variables meet requirements and available during CI/CD:
    1. `TWINE_REPOSITORY_URL`: The repository (package index) URL to upload the package to. If not set, it will upload to [the official PyPI](https://pypi.org).
    1. `TWINE_USERNAME`: The username to authenticate to the repository (package index) as, default to `__token__` which is used for [API token](https://pypi.org/help/#apitoken).
    1. `TWINE_PASSWORD`: The password to authenticate to the repository (package index) with.

    ```{note}
    Only `TWINE_PASSWORD` is necessary if the package is supposed to upload to the official PyPI with API token.
    ```

## Project Update

Thanks to the update mechanism provided natively by `copier`, when a new version of the template is released, you can easily update the project. Just run the following command under the root directory:

```bash
copier update
```

```{note}
The `-A/--skip-answered` flag can be used to skip questions that have already been answered.
```

In most cases, `copier` will manage updates seamlessly. will manage updates seamlessly. If conflicts arise, they can be resolved manually since everything is version-controlled by Git.

```{tip}
To minimize potential conflicts, there are several suggestions to follow:
1. Avoid modifying the auto-generated files unless absolutely necessary.
2. For project-related changes, it's advised to use the inheritance or extension approach instead of overwriting.
3. For template-related changes, consider proposing an issue or change request directly to the template.
```

For more details, please refer to `copier update --help` and [the official documentation](https://copier.readthedocs.io/en/stable/updating/).
