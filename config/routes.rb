Rails.application.routes.draw do
  get '/sign-up', to: 'users#new'
  resources :users, only: :create
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      resources :users, only: :create
      resources :sessions, only: :create
    end
  end
end
