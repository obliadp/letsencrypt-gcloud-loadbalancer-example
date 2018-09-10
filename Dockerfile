FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /root

RUN apt-get update \
    && apt-get install -y wget python \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-215.0.0-linux-x86_64.tar.gz \
    && tar -zxf google-cloud-sdk-215.0.0-linux-x86_64.tar.gz \
    && ./google-cloud-sdk/install.sh --usage-reporting false \
    && rm google-cloud-sdk-215.0.0-linux-x86_64.tar.gz

COPY update-cert /opt/


