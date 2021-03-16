FROM python:3-buster

LABEL maintainer="m7ericsson"

ENV AWS_CONFIG_FILE /.aws/config
ENV AWS_SHARED_CREDENTIALS_FILE /.aws/credentials

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.19.28.zip" -o "awscli-bundle.zip" \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" \
  && dpkg -i session-manager-plugin.deb

ENTRYPOINT [ "aws" ]
