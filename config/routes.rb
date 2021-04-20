Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :bids
        resources :experiences
      end
      resources :businesses, only: [:create] do
        resources :bid_responses
      end
      resources :bids do
        resources :bid_responses
      end
      resources :experiences, only: [:create] do
        resources :reviews
      end
      get '/users/profile', to: 'users#profile'
      get '/businesses/profile', to: 'businesses#profile'
      get '/businesses/open_bids', to: 'businesses#available_bids'
      post '/users/login', to: 'auth#create_user'
      post '/businesses/login', to: 'auth#create_business'
    end
  end

end
