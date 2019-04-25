# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'users#login', as: :login
      get '/products', to: 'products#index'
      # get token from the body
      get '/farmer', to: 'users#farmer_list'
      # delete the product if the farmer want to do so, need token, product id
      delete '/product/:id', to: 'products#destroy'
      post '/product', to: 'products#create'
      get '/products/:id', to: 'products#show'
    end
  end
end
