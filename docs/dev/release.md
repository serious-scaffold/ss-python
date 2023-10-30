# Release Process

The release process is primarily automated to ensure consistency and efficiency. The automation is mostly handled by GitHub Actions or GitLab CI/CD, with the help of tools like `git-changelog`. To ensure seamless execution, maintainers should follow specific guidelines and conventions throughout the development and release cycles.

The release process includes the following tasks:

1. Build the documentation, which includes automatically generated [changelog](../changelog.md), [coverage report](../reports/coverage/index.md) and [mypy report](../reports/mypy/index.md).
1. Deploy the documentation to GitHub/GitLab Pages.
1. Build the Python package.
1. Upload the package to the configured package repository.

## Trigger a New Release

To trigger a new release, the only action the maintainer needs to take is pushing a tag that follows the [Semantic Versioning](https://semver.org/) standard, for example, `v1.2.3`. Ensure that this tag is unique and represents a version higher than the previously released one.

You can execute these steps locally using a [`git reference`](https://git-scm.com/book/en/v2/Git-Internals-Git-References) that points to the default branch (e.g., `main`) of the upstream repository. In this example, `upstream` represents the [`git remote`](https://git-scm.com/docs/git-remote). The general workflow is as follows:

```bash
git fetch upstream       # Fetch the latest changes
git checkout main        # Switch to the main branch
git tag v1.2.3           # Add a new tag (replace with your version number)
git push upstream --tags # Push the tag to the upstream
```

```{tip}
Releasing a new version based on an old commit can be useful in scenarios where you wish to publish a previous stable state. Just ensure the released version is as expected.
```

## Guidelines to Follow

1. **Semantic Versioning Compatible Tags:** It's crucial to make sure tags follow the semantic versioning pattern. This adherence ensures the correct activation of the automated release process.
1. **Commit Convention:** While not mandatory, it is beneficial to ensure an informative changelog by following the [Commit Convention](commit.md#commit-message-pattern) so that corresponding commit messages will be included in the changelog.
1. **Package Repository Configuration:** Make sure the package upload destination is properly configured as mentioned in the [project configuration](proj.md#project-configuration).
