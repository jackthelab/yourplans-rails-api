Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :destroy]
      resources :businesses, only: [:index, :show, :create, :update, :destroy]
    end
  end

  # get '/profile', to: 'users#profile'
  # post '/login', to: 'auth#create'
end
