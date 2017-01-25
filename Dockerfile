FROM ruby:2.3.3-slim
MAINTAINER SquareScale Engineering <engineering@squarescale.com>
LABEL name=bundle
LABEL version=0.1.0
LABEL description="Bundler in docker, with needed dependencies to many \
ruby applications"
ENV REFRESHED_AT 2016-08-24
RUN apt-get update && \
  apt-get install -y --no-install-recommends curl=7.38.0-4+deb8u5 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -
RUN apt-get install -y --no-install-recommends build-essential=11.7 nodejs=7.4.0-1nodesource1~jessie1 git=1:2.1.4-2.1+deb8u2 sudo=1.8.10p3-1+deb8u3 && \
  apt-get -y clean && \
  apt-get -y autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/cache/* && \
  rm -rf /var/lib/log/* && \
  rm -rf /tmp/* && \
  rm -rf /var/lib/apt/lists/*
RUN mkdir -p /usr/src/web
WORKDIR /usr/src/web

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
