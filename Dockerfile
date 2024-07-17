# Use the official Ruby image as the base image
FROM ruby:3.3 AS production_base_image
ARG USERNAME=battle-stadium
# Create a group and user
RUN mkdir -p /workspaces/$USERNAME && \
  groupadd -r $USERNAME && \
  useradd -m -d /home/$USERNAME --no-log-init -r -g $USERNAME $USERNAME && \
  chown -R $USERNAME:$USERNAME /workspaces/$USERNAME

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

FROM mcr.microsoft.com/devcontainers/ruby:3.3-bookworm AS dev_container_base_image
ARG USERNAME=battle-stadium

RUN mkdir -p /workspaces/$USERNAME && \
  groupadd -r $USERNAME && \
  useradd -m -d /home/$USERNAME --no-log-init -r -g $USERNAME $USERNAME && \
  chown -R $USERNAME:$USERNAME /workspaces/$USERNAME

# Used to persist bash history as per https://code.visualstudio.com/remote/advancedcontainers/persist-bash-history
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  && mkdir /commandhistory \
  && touch /commandhistory/.bash_history \
  && chown -R $USERNAME /commandhistory \
  && echo "$SNIPPET" >> "/home/$USERNAME/.bashrc" \
  && echo "$SNIPPET" >> "/home/$USERNAME/.zshrc"

RUN \
  apt-get update -qq && \
  apt-get install -y -q postgresql-client openssl libssl-dev libpq-dev git  watchman && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  mkdir -p /workspaces/$USERNAME

WORKDIR /workspaces/$USERNAME

COPY Gemfile* /workspaces/$USERNAME/.
RUN \
  bundle update --bundler && \
  bundle config set path ~/.bundle && \
  bundle install

FROM dev_container_base_image AS development
ARG USERNAME=battle-stadium

COPY . /workspaces/$USERNAME/.
CMD ["rails", "server", "-b", "0.0.0.0"]

