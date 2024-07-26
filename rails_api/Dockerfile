FROM mcr.microsoft.com/devcontainers/ruby:3 AS base-base
RUN mkdir -p "/workspaces/battle-stadium"
RUN apt-get update -qq && \
  apt-get --no-install-recommends install -y -q default-jre postgresql-client openssl libssl-dev libpq-dev git watchman curl && \
  curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get --no-install-recommends install -y nodejs && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

##
## DEVELOPMENT IMAGE BASE
##
FROM base-base AS development-base-image
ARG USERNAME=battle-stadium

COPY Gemfile Gemfile.lock /workspaces/battle-stadium/
RUN bundle update --bundler
RUN bundle config set path ~/.bundle
RUN bundle install

##
## DEVELOPMENT IMAGE
##
FROM development-base-image AS development
ARG USERNAME=battle-stadium
ENV USERNAME=$USERNAME

WORKDIR /workspaces/battle-stadium

COPY app /workspaces/battle-stadium/app
COPY bin /workspaces/battle-stadium/bin
COPY config /workspaces/battle-stadium/config
COPY db /workspaces/battle-stadium/db
COPY lib /workspaces/battle-stadium/lib
COPY public /workspaces/battle-stadium/public
COPY storage /workspaces/battle-stadium/storage
COPY Rakefile /workspaces/battle-stadium/Rakefile
COPY vendor /workspaces/battle-stadium/vendor
COPY config.ru /workspaces/battle-stadium/config.ru
COPY .ruby-version /workspaces/battle-stadium/.ruby-version

RUN bundle check || bundle install
ENTRYPOINT [ "./bin/docker-entrypoint" ]



