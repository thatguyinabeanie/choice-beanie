# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :discord, ENV['DISCORD_CLIENT_ID'], ENV['DISCORD_CLIENT_SECRET'], scope: 'identify email'
end
