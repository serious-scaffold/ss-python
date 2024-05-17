# Release Process

The release process is primarily automated to ensure consistency and efficiency. The automation is mostly handled by GitHub Actions or GitLab CI/CD, with the help of [semantic-release](https://github.com/semantic-release/semantic-release). To ensure seamless execution, maintainers should follow specific guidelines and conventions throughout the development and release cycles.

The release process includes the following tasks:

::::{tab-set}

:::{tab-item} GitHub
:sync: github

1. Publish a new GitHub Release.
1. Build and publish the documentation to GitHub Pages.
1. Build and publish the Python package to the designated package repository.
1. Build and publish the Development and Production Containers with the build cache to GitHub Packages.
    1. The Production Container is tagged as `ghcr.io/serious-scaffold/ss-python:py<PYTHON_VERSION>` for the latest version and `ghcr.io/serious-scaffold/ss-python:py<PYTHON_VERSION>-<PROJECT_VERSION>` for archives.
    1. The Development Container is tagged as `ghcr.io/serious-scaffold/ss-python/dev:py<PYTHON_VERSION>` for the latest version and `ghcr.io/serious-scaffold/ss-python/dev:py<PYTHON_VERSION>-<PROJECT_VERSION>` for archives.
    1. Build cache for the Development Container is tagged as `ghcr.io/serious-scaffold/ss-python/dev-cache:py<PYTHON_VERSION>`.

:::

:::{tab-item} GitLab
:sync: gitlab

1. Publish a new GitLab Release.
1. Build and publish the documentation to GitLab Pages.
1. Build and publish the Python package to the configured package repository.
1. Build and publish the Development and Production Containers with build cache to GitLab Container Registry.
    1. The Production Container is tagged as `registry.gitlab.com/serious-scaffold/ss-python:py<PYTHON_VERSION>` for the latest version and `registry.gitlab.com/serious-scaffold/ss-python:py<PYTHON_VERSION>-<PROJECT_VERSION>` for archives.
    1. The Development Container is tagged as `registry.gitlab.com/serious-scaffold/ss-python/dev:py<PYTHON_VERSION>` for the latest version and `registry.gitlab.com/serious-scaffold/ss-python/dev:py<PYTHON_VERSION>-<PROJECT_VERSION>` for archives.
    1. Build cache for the Development Container is tagged as `registry.gitlab.com/serious-scaffold/ss-python/dev-cache:py<PYTHON_VERSION>`.

:::

::::

## Trigger a New Release

The only action required to initiate a release is pushing a tag conforming to the [Semantic Versioning standard](https://semver.org/#spec-item-2), for example, `v1.2.3`.

All the steps can be executed locally while on a branch that is in sync with the default branch of the repository. Here is a general workflow, using `main` branch as an example:

```bash
git checkout main # Switch to the main branch
git pull          # Pull the latest changes
git tag v1.2.3    # Add a new tag (replace with your version number)
git push --tags   # Push the tag to the upstream
```

```{tip}
Releasing a new version based on an old commit can be useful in scenarios where you wish to publish a previous stable state. Just ensure the released version is as expected.
```

## Guidelines

1. **Valid Release Tags:** Ensure that tags are not only compatible with semantic versioning but also unique and represent a version that is newer than any previously released.
1. **Commit Convention:** While not mandatory, it is beneficial to ensure an informative changelog by following the [Commit Convention](../development/commit.md#commit-message-pattern) so that corresponding commit messages can be included in the changelog.
1. **Package Repository Configuration:** Make sure the package upload destination is properly configured as mentioned in the [project configuration](./config.md).
