Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'forecast', to: 'geocoding#show'
    end
  end
end
