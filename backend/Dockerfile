# Use the official Ruby image as the base image
FROM ruby:3.3

# Install dependencies required for Rails
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* /app/

# Install the gems specified in Gemfile
RUN bundle install

# Copy the current directory contents into the container at /myapp
COPY ./backend /app
COPY ./frontend /frontend

# Set the command to start the puma server
CMD ["rails", "server", "-b", "0.0.0.0"]
