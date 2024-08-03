##
## LINUX BASE IMAGE WITH DEVELOPMENT TOOLS & DEPENDENCIES
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS linux-base-image

RUN \
  # INSTALL DEPENDENCIES
  apt-get update -qq  \
  && apt-get --no-install-recommends install -y -q \
  build-essential libreadline-dev zlib1g-dev sudo \
  default-jre postgresql-client openssl libssl-dev libpq-dev wget git watchman curl \
  # INSTALL NODEJS
  && curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get --no-install-recommends install -y nodejs \
  # INSTALL RUBY HEADERS
  && apt-get --no-install-recommends install -y ruby-dev \
  # CLEAN UP
  && apt-get clean \
  && mkdir -p /workspaces/battle-stadium \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##
## DEVELOPMENT IMAGE
##
FROM linux-base-image AS development
ARG BATTLE_STADIUM=battle-stadium
ARG USERNAME=vscode
WORKDIR /workspaces/$BATTLE_STADIUM/
ENV DEV_ENVIRONMENT=devcontainer

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
COPY Gemfile Gemfile.lock /workspaces/$BATTLE_STADIUM/

RUN bundle install
EXPOSE 3000
WORKDIR /workspaces/$BATTLE_STADIUM
ENTRYPOINT [ "./bin/docker-entrypoint" ]
