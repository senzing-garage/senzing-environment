ARG BASE_IMAGE=debian:10.11@sha256:9a1f494bb52e5d18e2dfb0fd6e59dbfe69aae9feecff1b246ad69984fbe25772
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2021-12-07

LABEL Name="senzing/senzing-environment" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

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
