#!/bin/bash

set -e

current_dir=$(pwd)

##
## RAILS APP SETUP
##
cd $current_dir/rails_api

echo "Checking for bundle dependencies..."
bundle check || bundle install

export RAILS_DB_HOST=localhost
echo "Preparing database..."
bundle exec rails db:prepare

echo "Migrating database..."
bundle exec rake db:migrate

echo "Precompiling Rails assets..."
bundle exec rake assets:precompile

echo "Building OpenAPI yaml..."
bundle exec rails rswag

##
## Build frontend
##
cd $current_dir
echo "Generating Typescript API client..."
npm run generate:api
echo "Building frontend..."
npm run build

# Copy frontend build output to Rails public directory
echo "Copying nextjs build output to Rails public directory..."
cd $current_dir
cp -r nextjs/dist/* rails_app/public/

