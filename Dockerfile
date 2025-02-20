# I had to increase my nofiles ulimit (to 65535) to run this Dockerfile.

FROM debian:bookworm-20240904

RUN apt-get update && \
    apt-get install -y curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSfL https://github.com/leanprover/elan/releases/download/v4.0.0/elan-x86_64-unknown-linux-gnu.tar.gz > elan-init.tar.gz && \
    tar -xf elan-init.tar.gz && \
    ./elan-init --no-modify-path -y --default-toolchain none && \
    rm elan-init.tar.gz elan-init
ENV PATH="/root/.elan/bin:$PATH"

ADD tmp/artifact/aesop/lean-toolchain /tmp/toolchain
RUN bash -c 'elan toolchain install $(cat /tmp/toolchain)'

ADD tmp/artifact/ /artifact

# HACK: this seems to be the least bad way to get the dependencies' sources.
WORKDIR /artifact/aesop
RUN lake build +Batteries.Logic && \
    rm -rf .lake/packages/batteries/.lake

WORKDIR /artifact
ENTRYPOINT /bin/bash
