Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/neo', to: 'neo#index'
    end
  end
end
