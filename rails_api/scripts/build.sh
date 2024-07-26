#!/bin/bash

# Build Rails app
echo "Checking for bundle dependencies..."
bundle check || bundle install

echo "Preparing database..."
bundle exec rails db:prepare

echo "Migrating database..."
bundle exec rake db:migrate

echo "Precompiling Rails assets..."
bundle exec rake assets:precompile

echo "Building OpenAPI yaml..."
bundle exec rails rswag

# Build frontend
cd frontend

echo "Generating Typescript API client..."
npm run generate:api
echo "Building frontend..."
npm run build

# Copy frontend build output to Rails public directory
echo "Copying frontend build output to Rails public directory..."
cp -r dist/* ../public/

