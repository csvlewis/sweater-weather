Rails.application.routes.draw do
  get '/sign-up', to: 'users#new'
  get '/login', to: 'sessions#new'
  resources :users, only: :create
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'background#show'
      post '/favorites', to: 'favorites#create'
      delete '/favorites', to: 'favorites#destroy'
      resources :users, only: :create
      resources :sessions, only: :create
    end
  end
end
