#!/bin/bash

# Build Rails app
bundle check || bundle install
bundle exec rails db:prepare
bundle exec rake db:migrate
bundle exec rake assets:precompile

# Build frontend
cd frontend
npm run generate:api
npm run build

# Copy frontend build output to Rails public directory
cp -r dist/* ../public/

