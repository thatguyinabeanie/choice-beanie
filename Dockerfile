##
## BASE IMAGE
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS base-base
ARG BATTLE_STADIUM=battle-stadium
RUN mkdir -p "/workspaces/$BATTLE_STADIUM"
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
ARG BATTLE_STADIUM=battle-stadium
WORKDIR /workspaces/$BATTLE_STADIUM
COPY rails_api/Gemfile rails_api/Gemfile.lock /workspaces/$BATTLE_STADIUM/

RUN \
  bundle update --bundler && \
  bundle config set path ~/.bundle && \
  bundle install

##
## DEVELOPMENT IMAGE
##
FROM development-base-image
ARG BATTLE_STADIUM=battle-stadium

WORKDIR /workspaces/$BATTLE_STADIUM

COPY rails_api/app /workspaces/$BATTLE_STADIUM/app
COPY rails_api/bin /workspaces/$BATTLE_STADIUM/bin
COPY rails_api/config /workspaces/$BATTLE_STADIUM/config
COPY rails_api/db /workspaces/$BATTLE_STADIUM/db
COPY rails_api/lib /workspaces/$BATTLE_STADIUM/lib
COPY rails_api/public /workspaces/$BATTLE_STADIUM/public
COPY rails_api/storage /workspaces/$BATTLE_STADIUM/storage
COPY rails_api/Rakefile /workspaces/$BATTLE_STADIUM/Rakefile
COPY rails_api/vendor /workspaces/$BATTLE_STADIUM/vendor
COPY rails_api/config.ru /workspaces/$BATTLE_STADIUM/config.ru
COPY .ruby-version /workspaces/$BATTLE_STADIUM/.ruby-version

RUN bundle check || bundle install
ENTRYPOINT [ "./bin/docker-entrypoint" ]



