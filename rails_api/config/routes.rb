# config/routes.rb
Rails.application.routes.draw do
  get 'static/index'
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Defines the root path route ("/")
  # root to: 'home#index'

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/up' => 'rails/health#show', as: :rails_health_check

  # get '*path', to: 'static#index', constraints: ->(req) { !req.xhr? && req.format.html? }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/auth/:provider/callback', to: 'sessions#create'

      resources :matches, only: %i[index show update]
      resources :users, only: %i[index show update]

      resources :organizations, only: %i[index show create update] do
        member do
          get 'staff', to: 'organizations#staff'
        end
      end
      resources :games, only: %i[index show create update destroy]
      resources :tournaments do
        resources :players, only: %i[create destroy index], controller: 'tournament/players'
        resources :matches, only: %i[index create update]
      end
    end
  end
end