source 'https://rubygems.org'

# Specify your Ruby version
ruby '3.3.4'

# Rails framework
gem 'rails', '~> 7.1'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'

# Use the Puma web server [https://github.com/puma/puma]

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Puma as the app server
gem 'puma', '~> 6.0'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.5.6'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Serialize API responses to JSON
gem 'active_model_serializers', '~> 0.10.0'

# Simplify API version management
gem 'versionist'

# Background jobs
gem 'sidekiq', '~> 7'

gem 'devise', '~> 4.9'

# Use Redis for cache and sessions
gem 'redis', '~> 4.0'

# For secure token authentication
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth', '~> 1'
gem 'omniauth-discord', '~> 1'
gem 'omniauth-rails_csrf_protection'

gem 'friendly_id', '~> 5.5.0'

gem 'devise-jwt'
gem 'jsonapi-serializer'
gem 'openssl', '~> 3.2'
gem 'rswag'

# For documentation and testing your API
group :development, :test do
  gem 'brakeman'
  gem 'dotenv-rails', groups: %i[development test]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false

  gem 'webmock'

  gem 'bundler-audit'
  gem 'debug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop-factory_bot'
  gem 'ruby-lsp'
  gem 'traceroute'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'listen', '~> 3.3'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec_junit_formatter'
  gem 'rubocop-junit-formatter'
  gem 'ruby_audit'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'simplecov'
end

source 'https://rubygems.org'

ruby '3.3.4'
