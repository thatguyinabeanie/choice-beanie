# config/routes.rb
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations',
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
  #
  get '/up' => 'rails/health#show', as: :rails_health_check
  namespace :api do
    namespace :v1 do
      get '/auth/:provider/callback', to: 'sessions#create'
      resources :users, only: %i[index show update]
      resources :tournaments do
        resources :registrations, only: %i[create destroy]
        resources :matches, only: %i[index create update]
      end
    end
  end
end
