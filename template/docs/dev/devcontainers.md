# Development Containers

Instead of manually configuring your development environment, [Dev Containers](https://containers.dev/) offer a seamless containerized development experience right out of the box.

## Prerequisites

Before you can use a Dev Container, you will need to install a few components.

1. [Docker Desktop](https://www.docker.com/products/docker-desktop) or an [alternative Docker option](https://code.visualstudio.com/remote/advancedcontainers/docker-options).
1. [Visual Studio Code](https://code.visualstudio.com/).
1. The [Dev Containers extension](vscode:extension/ms-vscode-remote.remote-containers) within VSCode.

## Frequently used commands

When you open a repository in VSCode that contains a Dev Container configuration,  you will be automatically prompted to reopen the folder in the container.

```{image} /_static/images/dev-container-reopen-prompt.png
:alt: Dev Container Reopen Prompt.
```

Here are some commands you might find yourself using frequently:

Dev Containers: Reopen in Container
: Triggers the containerized environment setup upon opening a repository configured for Dev Containers.

Dev Containers: Rebuild Without Cache and Reopen in Container
: Useful for refreshing your environment in case of issues or to update to a newer version.

Dev Containers: Clean Up Dev Containers...
: Deletes stopped Dev Container instances and removes unused volumes, helping maintain a clean development environment.

## Reference

For more detailed guidance and advanced usage, explore the following resources:

- [Dev Containers tutorial](https://code.visualstudio.com/docs/devcontainers/tutorial)
- [Developing inside a Container](https://code.visualstudio.com/docs/devcontainers/containers)
