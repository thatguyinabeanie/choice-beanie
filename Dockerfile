# Use the official Ruby image as the base image
FROM ruby:3.3 AS production_base_image
ARG USERNAME=battle-stadium

# Install dependencies required for Rails
RUN \
  apt-get update -qq && \
  apt-get install -y -q  nodejs postgresql-client openssl libssl-dev libpq-dev git  watchman && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir -p /workspaces/$USERNAME

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* /workspaces/$USERNAME/.

# Install the gems specified in Gemfile
WORKDIR /workspaces/$USERNAME

RUN \
  bundle update --bundler && \
  bundle config set path ~/.bundle && \
  bundle install

# Copy the current directory contents into the container at /myapp
COPY . /workspaces/$USERNAME/.


#
# PRODUCTION IMAGE
#
FROM  production_base_image AS production
ARG USERNAME=battle-stadium
# USER $USERNAME
# Set the command to start the puma server
WORKDIR /workspaces/$USERNAME
CMD ["rails", "server", "-b", "0.0.0.0"]


#
# DEVELOPMENT IMAGE
#
FROM mcr.microsoft.com/devcontainers/ruby:3 AS dev_container_base_image
ARG USERNAME=battle-stadium
RUN mkdir -p /workspaces/$USERNAME
WORKDIR /workspaces/$USERNAME
COPY .nvmrc Gemfile* /workspaces/$USERNAME
RUN \
  apt-get update -qq && \
  apt-get install -y -q postgresql-client openssl libssl-dev libpq-dev git  watchman && \
  apt-get clean && \
  bundle update --bundler && \
  bundle config set path ~/.bundle && \
  nvm install && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

FROM dev_container_base_image AS development
ARG USERNAME=battle-stadium

COPY . /workspaces/$USERNAME/.
CMD ["rails", "server", "-b", "0.0.0.0"]

