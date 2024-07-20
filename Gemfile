source 'https://rubygems.org'

# Specify your Ruby version
ruby '3.3.4'

# Rails framework
gem 'rails', '~> 7.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use the Puma web server [https://github.com/puma/puma]

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 2'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 2'

gem 'cancancan', '~> 3'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 5'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
gem 'kredis', '~> 1'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem 'bcrypt', '~> 3'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Puma as the app server
gem 'puma', '~> 6.0'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.5.6'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 2'

# Serialize API responses to JSON
gem 'active_model_serializers', '~> 0'

# Simplify API version management
gem 'versionist', '~> 2'

# Background jobs
gem 'sidekiq', '~> 7'

gem 'devise', '~> 4.9'
gem 'rack-attack', '~> 6'
# For secure token authentication
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth', '~> 1'
gem 'omniauth-discord', '~> 1'
gem 'omniauth-rails_csrf_protection', '~> 1'

gem 'friendly_id', '~> 5.5.0'

gem 'devise-jwt', '~> 0'
gem 'jsonapi-serializer', '~> 2'
gem 'openssl', '~> 3.2'
gem 'rswag', '~> 2'

# For documentation and testing your API
group :development, :test do
  gem 'brakeman', '~> 6', require: false
  gem 'dotenv-rails', '~> 3'
  gem 'factory_bot_rails', '~> 6'
  gem 'faker', '~> 3'
  gem 'rails-controller-testing', '~> 1'
  gem 'rspec-rails', '~> 6'

  gem 'webmock', '~> 3'

  gem 'bundler-audit', '~> 0'
  gem 'debug', '~> 1'
  gem 'pry-byebug', '~> 3'
  gem 'pry-rails', '~> 0'

  gem 'ruby-lsp', '~> 0'
  gem 'traceroute', '~> 0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'listen', '~> 3.3'
  gem 'web-console', '~> 4'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 4'
end

group :test do
  # gem 'capybara', '~> 3'
  gem 'database_cleaner-active_record', require: false
  gem 'rspec_junit_formatter', '~> 0'

  gem 'ruby_audit', '~> 2', require: false
  gem 'selenium-webdriver', '~> 4', require: false
  gem 'shoulda-matchers', '~> 6'
  gem 'simplecov', require: false
end

group :development, :test, :rubocop do
  gem 'rubocop', require: false

  # gem 'rubocop-capybara', require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'rubocop-git', require: false

  gem 'rubocop-erb', require: false
  gem 'rubocop-factory_bot', require: false
  gem 'rubocop-graphql', require: false
  gem 'rubocop-i18n', require: false
  gem 'rubocop-junit-formatter', require: false
  gem 'rubocop-md', require: false
  gem 'rubocop-migrations', require: false
  gem 'rubocop-minitest', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rails_config', require: false
  gem 'rubocop-rails_deprecation', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false
  gem 'rubocop-thread_safety', require: false
end

source 'https://rubygems.org'

ruby '3.3.4'
