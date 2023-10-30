# Release Process

The release process is primarily automated to ensure consistency and efficiency. The automation is mostly handled by GitHub Actions or GitLab CI/CD, with the help of tools like `git-changelog`. To ensure seamless execution, maintainers should follow specific guidelines and conventions throughout the development and release cycles.

The release process includes the following tasks:

1. Build the documentation, which includes automatically generated [changelog](../changelog.md), [coverage report](../reports/coverage/index.md) and [mypy report](../reports/mypy/index.md).
1. Deploy the documentation to GitHub/GitLab Pages.
1. Build the Python package.
1. Upload the package to the configured package repository.

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
1. **Commit Convention:** While not mandatory, it is beneficial to ensure an informative changelog by following the [Commit Convention](commit.md#commit-message-pattern) so that corresponding commit messages can be included in the changelog.
1. **Package Repository Configuration:** Make sure the package upload destination is properly configured as mentioned in the [project configuration](proj.md#project-configuration).
