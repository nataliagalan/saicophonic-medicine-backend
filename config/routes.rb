Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :videos
      resources :tags, only: [:index, :create, :show]
      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      get '/videos/search/:query', to: 'videos#search', as: :search
      get '/videos/tagged/:tag', to: 'videos#search_tagged'
      get '/tags/search/:query', to: 'tags#search'
      get '/random', to: 'videos#random', as: :random
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
