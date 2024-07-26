##
## BASE IMAGE
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS base-base
ARG BATTLE_STADIUM=battle-stadium

ENV \
  BUNDLE_PATH="/workspaces/$BATTLE_STADIUM/vendor/bundle" \
  BUNDLE_BIN="/workspaces/$BATTLE_STADIUM/vendor/bundle/bin" \
  GEM_HOME="/workspaces/$BATTLE_STADIUM/vendor/bundle" \
  GEM_PATH="/workspaces/$BATTLE_STADIUM/vendor/bundle" \
  PATH="/workspaces/$BATTLE_STADIUM/vendor/bundle/bin:$PATH"

RUN \
  # DIRECTORY FOR THE WORKSPACES
  mkdir -p "/workspaces/$BATTLE_STADIUM" && \
  # CREATE BATTLE-STADIUM USER AND GROUP
  groupadd -r "$BATTLE_STADIUM" && \
  useradd -r -g "$BATTLE_STADIUM" "$BATTLE_STADIUM" && \
  chown -R "$BATTLE_STADIUM:$BATTLE_STADIUM" "/workspaces" && \
  # INSTALL DEPENDENCIES
  apt-get update -qq && \
  apt-get --no-install-recommends install -y -q default-jre postgresql-client openssl libssl-dev libpq-dev git watchman curl && \
  # INSTALL NODEJS
  curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get --no-install-recommends install -y nodejs && \
  # CLEAN UP
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER $BATTLE_STADIUM

##
## DEVELOPMENT IMAGE BASE
##
FROM base-base AS bundler-base
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
FROM bundler-base AS development
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



