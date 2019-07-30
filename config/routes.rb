Rails.application.routes.draw do
  # devise_for :users, defaults: { format: :json }
  scope 'api' do
    scope 'v1' do
      get '/me', to: 'application#me', defaults: { format: :json }
      use_doorkeeper do
        # No need to register client application
        skip_controllers :applications, :authorized_applications
      end
    end
  end
  devise_for :users, path: '/api/v1/users', defaults: { format: :json }, controllers: {
    registrations: 'api/v1/users/registrations',
  }, skip: [:sessions, :password]
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      jsonapi_resources :groups
      jsonapi_resources :matches
      jsonapi_resources :memberships
      jsonapi_resources :picks
      jsonapi_resources :sports
      jsonapi_resources :teams
      jsonapi_resources :tournaments
      jsonapi_resources :users, only: [:index, :show]
    end
  end
end
