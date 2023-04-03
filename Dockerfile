ARG BASE_IMAGE=debian:11.6-slim@sha256:7acda01e55b086181a6fa596941503648e423091ca563258e2c1657d140355b1
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2023-04-03

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
