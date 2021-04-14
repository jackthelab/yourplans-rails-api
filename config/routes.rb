Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create] do
        resources :bids
      end
      resources :businesses, only: [:show, :create] do
        resources :bid_responses
      end
    end
  end

  get '/users/profile', to: 'users#profile'
  get '/businesses/profile', to: 'businesses#profile'
  post '/login', to: 'auth#create'
  
end
