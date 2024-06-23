# Tests

With all those automation of the CI/CD, the dependency update and the release process, tests play an even more important role in daily development. We leverage [pytest](https://docs.pytest.org/) and [coverage](https://coverage.readthedocs.io) with proper configuration to ensure everything works as expected. This page shows the general information and convention wish you to follow.

## Run tests

After [setting up development environment](./setup-dev-env.md), tests can be run with the command:

```bash
make test
```

With the default configuration, it shows the result for each test cases, the execution time for the slow test cases and the report about the test coverage.

## Write tests

For the guideline on how to write tests, you may refer to [the official documentation](https://docs.pytest.org/how-to/assert.html). Here are some convention expected to be followed:

1. Organize all the tests cases under the `tests` directory.
1. Keep the test modules align with the modules to be tested.

   For example, tests for `ss_python.cli` module should be located in the file `tests/cli_test.py`. If there are too many test cases, we can split them in the files `tests/cli/<prefix>_test.py`.
1. Unless necessary, it is not recommended to lower the threshold of the test coverage.

## Coverage Report

After running the tests, coverage report will not only be printed on the screen but also be generated as part of the documentation, you can view it [here](../reports/coverage/index.md).
