# Project Management

## Prerequisites

[`copier`](https://copier.readthedocs.io/) serves as a key tool in `serious-scaffold`, differentiating it from other project templates. The installation can be done with the following command.

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
    The provided repository URL, `git@git.example.com/demo_namespace/demo_name.git`, is purely for demonstration purposes.
    ```

    ```bash
    git clone git@git.example.com/demo_namespace/demo_name.git
    cd demo_name
    ```

1. Generate the project.

    ```{note}
    Several questions will be prompted during this process. Your patience is appreciated for this one-time job.
    ```

    ```bash
    copier copy gh:serious-scaffold/ss-python .
    ```

1. Set up the development environment.

    ```bash
    make dev
    ```

1. Commit and push the initialized project.

    ```bash
    git add .
    git commit -m "chore: Initialize from ss-python."
    SKIP=no-commit-to-branch git push
    ```

Now, everything is done for initialization.

## Project Configuration

Below are key recommended configurations. You can adjust these based on your specific needs.

1. Require a pull request or merge request before merging to the default branch.
1. Ensure passing CI/CD before merging to the default branch.
1. Require squash merging and use pull request or merge request title as commit message.
1. Allow only maintainers to create tags matching the `v*` pattern, for example, `v1.2.3`.
1. Ensure Linux-based CI/CD runner(s) are available.
1. Ensure GitHub/GitLab Pages is enabled and properly configured.
1. Ensure the following environment variables meet the project's requirements and are accessible during CI/CD process:
    1. `TWINE_REPOSITORY_URL`: The repository (package index) URL to upload the package to. If not set, it will upload to [the official PyPI](https://pypi.org).
    1. `TWINE_USERNAME`: The username to authenticate to the repository (package index) as, default to `__token__` which is used for [API token](https://pypi.org/help/#apitoken).
    1. `TWINE_PASSWORD`: The password to authenticate to the repository (package index) with.

    ```{note}
    Only `TWINE_PASSWORD` is necessary if the package is supposed to upload to [the official PyPI](https://pypi.org) with [API token](https://pypi.org/help/#apitoken).
    ```

```{note}
With proper configuration, everything is ready for a new release. Please refer to <project:release.md#trigger-a-new-release>.
```

## Project Update

Thanks to the update mechanism provided natively by `copier`, when a new version of the template is released, you can easily update the project. Just run the following command under the root directory:

```bash
copier update
```

```{note}
The `-A/--skip-answered` flag can be used to skip questions that have already been answered.
```

In most cases, `copier` will manage updates seamlessly. If conflicts arise, they can be resolved manually since everything is version-controlled by Git.

```{tip}
To minimize potential conflicts, there are several suggestions to follow:
1. Avoid modifying the auto-generated files unless absolutely necessary.
1. For template-related changes, consider proposing an issue or change request directly to the template repository.
1. For project-specific changes, adopt an inheritance or extension approach to minimize the changes to auto-generated contents.
```

For more details, please refer to `copier update --help` and [the official documentation](https://copier.readthedocs.io/en/stable/updating/).
