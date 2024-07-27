##
## BASE IMAGE
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS base-image

ARG BATTLE_STADIUM=battle-stadium
ARG RAILS_API=rails_api
ARG NEXTJS=nextjs
ENV \
  ZSH="/home/$BATTLE_STADIUM/.oh-my-zsh" \
  BUNDLE_PATH="/workspaces/$BATTLE_STADIUM/$RAILS_API/vendor/bundle" \
  BUNDLE_BIN="/workspaces/$BATTLE_STADIUM/$RAILS_API/vendor/bundle/bin" \
  GEM_HOME="/workspaces/$BATTLE_STADIUM/$RAILS_API/vendor/bundle" \
  GEM_PATH="/workspaces/$BATTLE_STADIUM/$RAILS_API/vendor/bundle" \
  PATH="/workspaces/$BATTLE_STADIUM/$RAILS_API/vendor/bundle/bin:$PATH" \
  PATH="/workspaces/$BATTLE_STADIUM/$RAILS_API/bin:$PATH"

RUN \
  # CREATE BATTLE-STADIUM USER AND GROUP
  mkdir -p "/home/$BATTLE_STADIUM" && \
  mkdir -p "/workspaces/$BATTLE_STADIUM/$RAILS_API" && \
  mkdir -p "/workspaces/$BATTLE_STADIUM/$NEXTJS"

COPY $RAILS_API/Gemfile $RAILS_API/Gemfile.lock  /workspaces/$BATTLE_STADIUM/$RAILS_API/
COPY .zshrc /home/$BATTLE_STADIUM/.zshrc

RUN \
  # INSTALL DEPENDENCIES
  apt-get update -qq && \
  apt-get --no-install-recommends install -y -q default-jre postgresql-client openssl libssl-dev libpq-dev wget git watchman curl zsh && \
  # INSTALL NODEJS
  curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - && \
  apt-get --no-install-recommends install -y nodejs && \
  # CLEAN UP
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  groupadd -r "$BATTLE_STADIUM" && \
  useradd -r -g "$BATTLE_STADIUM" -d "/home/$BATTLE_STADIUM" -s /bin/zsh "$BATTLE_STADIUM" && \
  chown -R "$BATTLE_STADIUM:$BATTLE_STADIUM" "/home/$BATTLE_STADIUM" && \
  chown -R "$BATTLE_STADIUM:$BATTLE_STADIUM" "/workspaces" && \
  chmod -R u+w "/workspaces/$BATTLE_STADIUM" && \
  chmod -R u+w "/home/${BATTLE_STADIUM}" && \
  chmod 777 /home/${BATTLE_STADIUM}/.zshrc && \
  chsh -s $(which zsh) ${BATTLE_STADIUM} && \
  cd "/workspaces/$BATTLE_STADIUM/$RAILS_API" && \
  bundle config set path "/home/$BATTLE_STADIUM/.bundle" && \
  bundle install

##
## DEVELOPMENT IMAGE
##
FROM base-image AS development
ARG RAILS_API=rails_api
ARG NEXTJS=nextjs
ARG BATTLE_STADIUM=battle-stadium

WORKDIR /workspaces/$BATTLE_STADIUM/$RAILS_API

# COPY .zshrc /home/$BATTLE_STADIUM/.zshrc
COPY $RAILS_API/app ./app
COPY $RAILS_API/bin/* ./bin/
COPY $RAILS_API/config ./config
COPY $RAILS_API/db ./db
COPY $RAILS_API/lib ./lib
COPY $RAILS_API/public ./public
COPY $RAILS_API/storage ./storage
COPY $RAILS_API/Rakefile ./Rakefile
COPY $RAILS_API/vendor ./vendor
COPY $RAILS_API/config.ru ./config.ru
COPY .ruby-version ./.ruby-version

USER $BATTLE_STADIUM

WORKDIR /workspaces/$BATTLE_STADIUM
ENTRYPOINT [ "./rails_api/bin/docker-entrypoint" ]
