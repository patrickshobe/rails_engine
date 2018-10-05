Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      namespace :transactions do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      namespace :merchants do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find#index'
        get '/random', to: 'random#show'
      end

      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers/invoices#index'
        get '/transactions', to: 'customers/transactions#index'
        get '/favorite_merchant', to: 'customers/favorite_merchant#show'
      end

      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/invoices#index'
      end

      resources :invoice_items, only: [:index, :show] do
        get '/invoice', to: 'invoice_items/invoices#index'
        get '/item', to: 'invoice_items/items#index'
      end

      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/transactions#index'
        get '/invoice_items', to: 'invoices/invoice_items#index'
        get '/items', to: 'invoices/items#index'
        get '/customers', to: 'invoices/customers#index'
        get '/merchants', to: 'invoices/merchants#index'
      end

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchants', to: 'items/merchants#index'
      end

      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
      end

    end
  end
end
