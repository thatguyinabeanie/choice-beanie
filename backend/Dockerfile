# Use the official Ruby image as the base image
FROM ruby:3.3 AS base_image

# Install dependencies required for Rails
RUN \
  apt-get update -qq && \
  apt-get install -y -q  nodejs postgresql-client

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* /src/backend/.

# Install the gems specified in Gemfile
RUN cd /src/backend && bundle install

# Copy the current directory contents into the container at /myapp

COPY . /src



FROM base_image AS production
# Set the command to start the puma server
CMD ["rails", "server", "-b", "0.0.0.0"]


FROM base_image AS  development
RUN cd /tmp \
  && git clone https://github.com/ddahan/watchman-binary.git \
  && mkdir -p /usr/local/bin /usr/local/var/run/watchman \
  && cd watchman-binary \
  && cp watchman /usr/local/bin \
  && chmod 755 /usr/local/bin/watchman \
  && chmod 2777 /usr/local/var/run/watchman
WORKDIR /src/backend

CMD ["rails", "server", "-b", "0.0.0.0"]
