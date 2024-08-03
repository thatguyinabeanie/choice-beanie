##
## BASE IMAGE WITH ASDF AND RUBY
##
FROM mcr.microsoft.com/devcontainers/ruby:3 AS asdf-ruby
ARG BATTLE_STADIUM=battle-stadium
RUN \
  mkdir -p /${BATTLE_STADIUM} && \
  apt-get update -qq && \
  apt-get --no-install-recommends install -y -q \
  curl \
  git \
  build-essential \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libpq-dev \
  && curl --proto "=https" --tlsv1.2 -sSf -L https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get --no-install-recommends install -y nodejs \
  && apt-get clean &&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install asdf
ARG ASDF_VERSION=v0.14.0
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch ${ASDF_VERSION}
ENV PATH="/root/.asdf/bin:/root/.asdf/shims:$PATH"

# Install asdf-ruby plugin
RUN asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

WORKDIR /battle-stadium
# Copy .ruby-version file to the container
COPY .tool-versions .

# Install Ruby using asdf based on .ruby-version
RUN asdf install

##
## BASE IMAGE WITH MORE DEV DEPENDENCIES
##
FROM asdf-ruby AS linux-base-image

RUN \
  # INSTALL DEPENDENCIES
  apt-get update -qq  && apt-get --no-install-recommends install -y -q  \
  default-jre postgresql-client openssl wget  watchman  ruby-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


##
## DEVELOPMENT IMAGE
##
FROM linux-base-image AS development
ARG BATTLE_STADIUM=battle-stadium
ARG USERNAME=vscode
WORKDIR /$BATTLE_STADIUM/
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
COPY Gemfile Gemfile.lock /$BATTLE_STADIUM/

RUN bundle install
EXPOSE 3000
WORKDIR /$BATTLE_STADIUM
ENTRYPOINT [ "./bin/docker-entrypoint" ]
