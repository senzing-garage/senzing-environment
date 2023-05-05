# senzing-environment examples

## Examples of CLI

The following examples require initialization described in
[Demonstrate using Command Line Interface](../README.md#demonstrate-using-command-line-interface).

### Add docker support to Senzing project directory

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

### Set environment for docker

1. Set environment.
   Example:

    ```console
    source ${SENZING_PROJECT_DIR}/docker-setupEnv
    ```

## Examples of Docker

The following examples require initialization described in
[Demonstrate using Docker](../README.md#demonstrate-using-docker).

1. Visit [senzing-environment tutorial](docs/tutorial.md).
