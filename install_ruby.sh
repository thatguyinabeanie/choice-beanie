#!/bin/bash

# Set the value of RUBY_VERSION to the first line of .ruby-version adjacent to this file
RUBY_VERSION=$(head -n 1 "$(dirname "$0")/.ruby-version")

# Check if the specified Ruby version is already installed
if [ -d "/Users/$(whoami)/.frum/versions/$RUBY_VERSION" ]; then
  exit 0
else
  echo "Installing Ruby $RUBY_VERSION..."
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew is not installed. Please install Homebrew first."
  exit 1
fi

# Check if OpenSSL is installed
if ! brew list --formula | grep -q openssl; then
  echo "OpenSSL is not installed. Please install OpenSSL using Homebrew."
  exit 1
fi

# Check if rbenv is installed
if ! command -v frum &> /dev/null; then
  echo "rbenv is not installed. Please install rbenv first."
  exit 1
fi

RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl)" frum install
