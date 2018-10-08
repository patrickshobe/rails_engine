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
        get '/most_items', to: 'top_items#show'
        get '/most_revenue', to: 'most_revenue#show'
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
        get '/most_revenue', to: 'most_revenue#index'
        get '/most_items', to: 'most_items#index'
        get '/revenue', to: 'total_revenue#show'
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
        get '/customer', to: 'invoices/customers#index'
        get '/merchant', to: 'invoices/merchants#index'
      end

      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/invoice_items#index'
        get '/merchant', to: 'items/merchants#index'
        get '/best_day', to: 'items/best_day#show'
      end

      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/items#index'
        get '/invoices', to: 'merchants/invoices#index'
        get '/favorite_customer', to: 'merchants/favorite_customer#show'
        get '/revenue', to: 'merchants/merchant_revenue#show'
        get '/customers_with_pending_invoices', to: 'merchants/pending_invoices#show'
      end

    end
  end
end
