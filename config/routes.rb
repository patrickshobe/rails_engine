Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
      end

      resources :customers, only: [:index, :show]


    end
  end
end
