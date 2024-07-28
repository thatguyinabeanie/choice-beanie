##
## BASE IMAGE
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS base-image
ARG BATTLE_STADIUM=battle-stadium

RUN \
  # CREATE BATTLE-STADIUM USER AND GROUP
  mkdir -p "/workspaces/$BATTLE_STADIUM"

COPY Gemfile Gemfile.lock /workspaces/$BATTLE_STADIUM/

WORKDIR /workspaces/$BATTLE_STADIUM/
RUN \
  # INSTALL DEPENDENCIES
  apt-get update -qq && \
  apt-get --no-install-recommends install -y -q \
  build-essential libreadline-dev  zlib1g-dev \
  default-jre postgresql-client openssl libssl-dev libpq-dev wget git watchman curl && \
  # INSTALL NODEJS
  curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get --no-install-recommends install -y nodejs && \
  # CLEAN UP
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  bundle install

##
## DEVELOPMENT IMAGE
##

FROM base-image AS development
ARG BATTLE_STADIUM=battle-stadium

COPY .zsh/.zshrc /root/.zshrc
COPY app ./app
COPY bin/* ./bin/
COPY config ./config
COPY db ./db
COPY lib ./lib
COPY public ./public
COPY storage ./storage
COPY Rakefile ./Rakefile
COPY vendor ./vendor
COPY config.ru ./config.ru

# RUN groupadd -r "$BATTLE_STADIUM" && useradd -m -r -g "$BATTLE_STADIUM" "$BATTLE_STADIUM"

# USER $BATTLE_STADIUM

WORKDIR /workspaces/$BATTLE_STADIUM
ENTRYPOINT [ "./bin/docker-entrypoint" ]
