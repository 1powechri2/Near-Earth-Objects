Rails.application.routes.draw do
  root to: 'home#show'
  namespace :api do
    namespace :v1 do
      get '/neo', to: 'neo#index'
    end
  end
end
