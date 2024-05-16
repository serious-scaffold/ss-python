# Partially Set Up Development Environment

In certain cases, it is unnecessary to install all dependencies as well as the pre-commit hook. For example, speed up the setup process in CI/CD.

## Minimal installation

Install the project in editable mode only with necessary dependencies, useful for scenarios like deployment.

```bash
make install
```

## Documentation generation

Install the project in editable mode with `doc` related dependencies,
recommended for scenarios like documentation generation CI/CD process.

```bash
make dev-doc
```

## Lint check

Install the project in editable mode with `lint` related dependencies,
recommended for scenarios like lint CI/CD process.

```bash
make dev-lint
```

## Package build

Install the project in editable mode with `package` related dependencies,
recommended for scenarios like package CI/CD process.

```bash
make dev-package
```

## Testing

Install the project in editable mode with `test` related dependencies,
recommended for scenarios like test CI/CD process.

```bash
make dev-test
```

## Combination

For example, to install dependencies for `doc` and `lint`, we can use the following command.

```bash
make dev-doc,lint
```
