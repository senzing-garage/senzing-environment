ARG BASE_IMAGE=debian:11.5-slim@sha256:b46fc4e6813f6cbd9f3f6322c72ab974cc0e75a72ca02730a8861e98999875c7
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-10-11

LABEL Name="senzing/senzing-environment" \
      Maintainer="support@senzing.com" \
      Version="1.4.1"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Install packages via apt.

RUN apt update \
 && apt -y install \
      python3-dev \
      python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Install packages via pip.

RUN pip3 install --upgrade pip \
 && pip3 install \
      parse

# Copy files from repository.

COPY ./rootfs /
COPY senzing-environment.py /app

# Runtime execution.

WORKDIR /app
ENTRYPOINT ["/app/senzing-environment.py"]
CMD ["--help"]
