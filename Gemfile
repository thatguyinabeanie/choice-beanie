# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your Ruby version
ruby '3.3.4'

# Rails framework
gem 'rails', '~> 7.1'

# Use Puma as the app server
gem 'puma', '~> 6.0'

# Use PostgreSQL as the database for Active Record
gem 'pg', '~> 1.2', '>= 1.2.3'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Serialize API responses to JSON
gem 'active_model_serializers', '~> 0.10.0'

# Simplify API version management
gem 'versionist'

# Background jobs
gem 'sidekiq'

gem 'devise'

# Use Redis for cache and sessions
gem 'redis', '~> 4.0'

# For secure token authentication
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth'
gem 'omniauth-discord'
gem 'omniauth-rails_csrf_protection'

gem 'openssl'
gem 'sorbet-static-and-runtime'

# For documentation and testing your API
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-rspec_rails', require: false

  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'debug', platforms: %i[mri windows]
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop-factory_bot'
  gem 'ruby-lsp'
  gem 'tapioca', require: false
  gem 'traceroute'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'listen', '~> 3.3'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers', '~> 4.0', require: false
end
