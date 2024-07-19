# config/routes.rb
Rails.application.routes.draw do # rubocop:disable Metrics/BlockLength
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  #   # omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  #

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  root to: 'home#index'

  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }

  get '/up' => 'rails/health#show', as: :rails_health_check
  namespace :api do
    namespace :v1 do
      get '/auth/:provider/callback', to: 'sessions#create'

      resources :matches, only: %i[index show update]
      resources :users, only: %i[index show update]

      resources :organizations, only: %i[index show create update] do
        member do
          get 'staff', to: 'organizations#staff'
        end
      end
      resources :games, only: %i[index show create update]
      resources :tournaments do
        resources :registrations, only: %i[create destroy index], controller: 'tournament/registrations'
        resources :matches, only: %i[index create update]
      end
    end
  end
end
