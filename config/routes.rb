# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/login', to: 'users#login', as: :login
      get '/products', to: 'product#index'
      # get token from the body
      get '/farmer', to: 'users#farmer_list'
    end
  end
end
