Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :bids
      end
      resources :businesses, only: [:create] do
        resources :bid_responses
      end
      get '/users/profile', to: 'users#profile'
      get '/businesses/profile', to: 'businesses#profile'
      post '/users/login', to: 'auth#create_user'
      post '/businesses/login', to: 'auth#create_business'
    end
  end

end
