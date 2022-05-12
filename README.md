# senzing-environment

## Synopsis

The [senzing-environment.py](senzing-environment.py) program
creates shell scripts in a `docker-bin/` directory
that are used to start, stop and restart Senzing Docker containers.

## Overview

The [senzing-environment.py](senzing-environment.py) program creates a `docker-bin/` directory that looks like the following:

```console
docker-bin
├── docker-environment-vars.sh
├── docker-images-load.sh
├── docker-images-save.sh
├── docker-pull-latest.sh
├── portainer.sh
├── postgres.sh
├── senzing-api-server.sh
├── senzing-console.sh
├── senzing-db2-driver-installer.sh
├── senzing-debug.sh
├── senzing-down.sh
├── senzing-info.sh
├── senzing-init-container.sh
├── senzing-jupyter.sh
├── senzing-mssql-driver-installer.sh
├── senzing-phppgadmin.sh
├── senzing-postgresql-init.sh
├── senzing-quickstart-demo.sh
├── senzing-rabbitmq.sh
├── senzing-sqlite-web.sh
├── senzing-sshd.sh
├── senzing-stream-loader.sh
├── senzing-stream-producer.sh
├── senzing-webapp-demo.sh
├── senzing-webapp.sh
├── senzing-xterm.sh
├── senzing-yum.sh
└── swagger-ui.sh
```

The function of each file can be seen in the
[Senzing environment reference](docs/reference.md).

### Contents

1. [Preamble](#preamble)
    1. [Legend](#legend)
1. [Related artifacts](#related-artifacts)
1. [Expectations](#expectations)
1. [Demonstrate using Command Line Interface](#demonstrate-using-command-line-interface)
    1. [Prerequisites for CLI](#prerequisites-for-cli)
    1. [Download](#download)
    1. [Run command](#run-command)
1. [Demonstrate using Docker](#demonstrate-using-docker)
    1. [Prerequisites for Docker](#prerequisites-for-docker)
    1. [Docker volumes](#docker-volumes)
    1. [Create Senzing project](#create-senzing-project)
    1. [Environment variables for Docker](#environment-variables-for-docker)
    1. [Run Docker container](#run-docker-container)
1. [Develop](#develop)
    1. [Prerequisites for development](#prerequisites-for-development)
    1. [Clone repository](#clone-repository)
1. [Examples](#examples)
    1. [Examples of CLI](#examples-of-cli)
    1. [Examples of Docker](#examples-of-docker)
1. [Advanced](#advanced)
    1. [Configuration](#configuration)
1. [Errors](#errors)
1. [References](#references)

## Preamble

At [Senzing](http://senzing.com),
we strive to create GitHub documentation in a
"[don't make me think](https://github.com/Senzing/knowledge-base/blob/main/WHATIS/dont-make-me-think.md)" style.
For the most part, instructions are copy and paste.
Whenever thinking is needed, it's marked with a "thinking" icon :thinking:.
Whenever customization is needed, it's marked with a "pencil" icon :pencil2:.
If the instructions are not clear, please let us know by opening a new
[Documentation issue](https://github.com/Senzing/senzing-environment/issues/new?template=documentation_request.md)
describing where we can improve.   Now on with the show...

### Legend

1. :thinking: - A "thinker" icon means that a little extra thinking may be required.
   Perhaps there are some choices to be made.
   Perhaps it's an optional step.
1. :pencil2: - A "pencil" icon means that the instructions may need modification before performing.
1. :warning: - A "warning" icon means that something tricky is happening, so pay attention.

## Related artifacts

1. [DockerHub](https://hub.docker.com/r/senzing/senzing-environment)

## Expectations

- **Space:** This repository and demonstration require 2 MB free disk space.
- **Time:** Budget 30 minutes to get the demonstration up-and-running, depending on CPU and network speeds.
- **Background knowledge:** This repository assumes a working knowledge of:
  - [Docker](https://github.com/Senzing/knowledge-base/blob/main/WHATIS/docker.md)

## Demonstrate using Command Line Interface

### Prerequisites for CLI

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. Install system dependencies:
    1. Use `apt` based installation for Debian, Ubuntu and
       [others](https://en.wikipedia.org/wiki/List_of_Linux_distributions#Debian-based)
        1. See [apt-packages.txt](src/apt-packages.txt) for list
    1. Use `yum` based installation for Red Hat, CentOS, openSuse and
       [others](https://en.wikipedia.org/wiki/List_of_Linux_distributions#RPM-based).
        1. See [yum-packages.txt](src/yum-packages.txt) for list
1. Install Python dependencies:
    1. See [requirements.txt](requirements.txt) for list
        1. [Installation hints](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-python-dependencies.md)

### Download

1. Get a local copy of
   [senzing-environment.py](senzing-environment.py).
   Example:

    1. :pencil2: Specify where to download file.
       Example:

        ```console
        export SENZING_DOWNLOAD_FILE=~/senzing-environment.py
        ```

    1. Download file.
       Example:

        ```console
        curl -X GET \
          --output ${SENZING_DOWNLOAD_FILE} \
          https://raw.githubusercontent.com/Senzing/senzing-environment/main/senzing-environment.py
        ```

    1. Make file executable.
       Example:

        ```console
        chmod +x ${SENZING_DOWNLOAD_FILE}
        ```

1. :thinking: **Alternative:** The entire git repository can be downloaded by following instructions at
   [Clone repository](#clone-repository)

### Run command

1. Run the command.
   Example:

   ```console
   ${SENZING_DOWNLOAD_FILE} --help
   ```

1. For more examples of use, see [Examples of CLI](#examples-of-cli).

## Demonstrate using Docker

### Prerequisites for Docker

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
    1. [docker](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-docker.md)

### Docker volumes

1. Specify the location of the Senzing project on the host system.
   Example:

    ```console
    export SENZING_PROJECT_DIR=~/senzing-demo-project-1
    ```

### Create Senzing project

:thinking: If a Senzing project directory already exists, this step may be skipped.
If a Senzing project directory is needed, perform the following step.

1. Create the Senzing project.
   Example:

    ```console
    /opt/senzing/g2/python/G2CreateProject.py ${SENZING_PROJECT_DIR}
    ```

### Environment variables for Docker

1. Give the Senzing project a name.
   The name is used as a prefix for docker containers.
   Example:

    ```console
    export SENZING_PROJECT_NAME=demo02
    ```

1. :pencil2: Identify the IP address of the host system.
   Example:

    ```console
    export SENZING_DOCKER_HOST_IP_ADDR=10.1.1.100
    ```

    1. To find the value for `SENZING_DOCKER_HOST_IP_ADDR` by using Python interactively, visit
       [SENZING_DOCKER_HOST_IP_ADDR](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_docker_host_ip_addr).

### Run Docker container

1. Run Docker container to add Docker support to the Senzing project directory.
   Example:

    ```console
    sudo docker run \
      --env SENZING_DOCKER_HOST_IP_ADDR=${SENZING_DOCKER_HOST_IP_ADDR} \
      --interactive \
      --rm \
      --tty \
      --user $(id -u):$(id -g) \
      --volume ${SENZING_PROJECT_DIR}:${SENZING_PROJECT_DIR} \
      senzing/senzing-environment add-docker-support-linux \
        --project-name ${SENZING_PROJECT_NAME} \
        --project-dir ${SENZING_PROJECT_DIR}
    ```

1. For more examples of use, see [Examples of Docker](#examples-of-docker).

## Develop

### Prerequisites for development

:thinking: The following tasks need to be complete before proceeding.
These are "one-time tasks" which may already have been completed.

1. The following software programs need to be installed:
    1. [git](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/install-git.md)

### Clone repository

For more information on environment variables,
see [Environment Variables](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md).

1. Set these environment variable values:

    ```console
    export GIT_ACCOUNT=senzing
    export GIT_REPOSITORY=senzing-environment
    export GIT_ACCOUNT_DIR=~/${GIT_ACCOUNT}.git
    export GIT_REPOSITORY_DIR="${GIT_ACCOUNT_DIR}/${GIT_REPOSITORY}"
    ```

1. Using the environment variables values just set, follow steps in [clone-repository](https://github.com/Senzing/knowledge-base/blob/main/HOWTO/clone-repository.md) to install the Git repository.

## Examples

### Examples of CLI

The following examples require initialization described in
[Demonstrate using Command Line Interface](#demonstrate-using-command-line-interface).

#### Add docker support to Senzing project directory

1. :pencil2: Identify Senzing Project directory.
   Example:

    ```console
    export SENZING_PROJECT_DIR=~/senzing-project
    ```

1. :pencil2: Give the Senzing project a name.
   The name is used as a prefix for docker containers.
   Example:

    ```console
    export SENZING_PROJECT_NAME=senzing
    ```

1. Add docker support to Senzing project directory
   Example:

    ```console
    senzing-environment.py add-docker-support \
      --project-name ${SENZING_PROJECT_NAME} \
      --project-dir ${SENZING_PROJECT_DIR}
    ```

#### Set environment for docker

1. Set environment.
   Example:

    ```console
    source ${SENZING_PROJECT_DIR}/docker-setupEnv
    ```

### Examples of Docker

The following examples require initialization described in
[Demonstrate using Docker](#demonstrate-using-docker).

1. Visit [senzing-environment tutorial](docs/tutorial.md).

## Advanced

### Configuration

Configuration values specified by environment variable or command line parameter.

- **[GIT_ACCOUNT](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#git_account)**
- **[GIT_REPOSITORY](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#git_repository)**
- **[GIT_ACCOUNT_DIR](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#git_account_dir)**
- **[GIT_REPOSITORY_DIR](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#git_repository_dir)**
- **[SENZING_DEBUG](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_debug)**
- **[SENZING_DOWNLOAD_FILE](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_download_file)**
- **[SENZING_DOCKER_HOST_IP_ADDR](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_docker_host_ip_addr)**
- **[SENZING_PROJECT_DIR](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_project_dir)**
- **[SENZING_PROJECT_NAME](https://github.com/Senzing/knowledge-base/blob/main/lists/environment-variables.md#senzing_project_name)**

## Errors

1. See [docs/errors.md](docs/errors.md).

## References
