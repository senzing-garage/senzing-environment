ARG BASE_IMAGE=debian:11.4-slim@sha256:a811e62769a642241b168ac34f615fb02da863307a14c4432cea8e5a0f9782b8
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2022-08-12

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
