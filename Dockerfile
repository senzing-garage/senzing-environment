ARG BASE_IMAGE=debian:11.3-slim@sha256:06a93cbdd49a265795ef7b24fe374fee670148a7973190fb798e43b3cf7c5d0f
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-05-16

LABEL Name="senzing/senzing-environment" \
      Maintainer="support@senzing.com" \
      Version="1.3.0"

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
