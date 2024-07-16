# Use the official Ruby image as the base image
FROM ruby:3.3 AS base_image

# Install dependencies required for Rails
RUN \
  apt-get update -qq && \
  apt-get install -y -q  nodejs postgresql-client openssl libssl-dev libpq-dev git  watchman && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* /workspaces/battle-stadium/.

# Install the gems specified in Gemfile
WORKDIR /workspaces/battle-stadium

RUN \
  bundle update --bundler && \
  bundle config set path 'vendor/bundle' && \
  bundle install

# Copy the current directory contents into the container at /myapp

COPY . /workspaces/battle-stadium/.



FROM base_image AS production
# Set the command to start the puma server
WORKDIR /workspaces/battle-stadium
CMD ["rails", "server", "-b", "0.0.0.0"]


FROM base_image AS  development
WORKDIR /workspaces/battle-stadium

CMD ["rails", "server", "-b", "0.0.0.0"]
