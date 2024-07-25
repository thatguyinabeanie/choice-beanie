#!/bin/bash

# Set the value of RUBY_VERSION to the first line of .ruby-version adjacent to this file
RUBY_VERSION=$(head -n 1 "$(dirname "$0")/.ruby-version")

# Check if the specified Ruby version is already installed
if [ -d "/Users/$(whoami)/.frum/versions/$RUBY_VERSION" ]; then
  echo "Ruby $RUBY_VERSION is already installed."
  exit 0
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

# Check if OpenSSL is installed
if ! brew list --formula | grep -q openssl; then
  echo "OpenSSL is not installed. Installing OpenSSL using Homebrew..."
  brew install openssl
fi

# Check if frum is installed
if ! command -v frum &> /dev/null; then
  echo "frum is not installed. Please install frum first."
  exit 1
fi


with_ssl_dir_option="--with-openssl-dir=$(brew --prefix openssl)"

echo "Installing Ruby $RUBY_VERSION $with_ssl_dir_option"
# Install Ruby with OpenSSL support
frum install $RUBY_VERSION $with_ssl_dir_option
