FROM ubuntu:22.04

COPY processor_1.0.deb /tmp/processor_1.0.deb

RUN apt update && \
    apt install -y /tmp/processor_1.0.deb && \
    rm /tmp/processor_1.0.deb && \
    rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["processor"]

