# Reference:
# - https://pdm-project.org/latest/usage/advanced/#use-pdm-in-a-multi-stage-dockerfile

ARG PYTHON_VERSION=3.12

########################################################################################
# Dev image is used for development and cicd.
########################################################################################

FROM python:${PYTHON_VERSION} as dev

RUN apt-get update && apt-get install -y --no-install-recommends \
#   To install Python applications.
    pipx \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Config pipx
ENV PIPX_HOME=/usr/local/pipx
ENV PIPX_BIN_DIR=/usr/local/bin

# Install pdm
RUN pipx install pdm

########################################################################################
# Build image is an intermediate image used for building the project.
########################################################################################

FROM dev as build

# Copy necessary files for build.
COPY pyproject.toml pdm.lock README.md /workspace/
COPY src/ /workspace/src
COPY .git/ /workspace/.git

# Install dependencies and project into the local packages directory.
WORKDIR /workspace
RUN mkdir __pypackages__ && pdm sync --prod --no-editable

########################################################################################
# Prod image is used for deployment and distribution.
########################################################################################

FROM python:${PYTHON_VERSION}-slim as prod

# NOTE: python docker image has env `PYTHON_VERSION` but with patch version.
# ARG is used here for temporary override without changing the original env.
ARG PYTHON_VERSION=3.12

# Retrieve packages from build stage.
ENV PYTHONPATH=/workspace/pkgs
COPY --from=build /workspace/__pypackages__/${PYTHON_VERSION}/lib /workspace/pkgs

# Retrieve executables from build stage.
COPY --from=build /workspace/__pypackages__/${PYTHON_VERSION}/bin/* /usr/local/bin/

# Set command to run the cli by default.
CMD ["ss-python-cli"]
