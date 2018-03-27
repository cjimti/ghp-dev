FROM alpine:3.7
MAINTAINER Craig Johnston <mk@imti.co>

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base zlib-dev
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler ruby-irb ruby-rdoc ruby-libs

RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES  --no-cache && \
    apk add $RUBY_PACKAGES  --no-cache

RUN gem install github-pages

RUN mkdir -p /src
WORKDIR /src

ENTRYPOINT ["/usr/bin/jekyll"]