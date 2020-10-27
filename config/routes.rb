Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :videos
      resources :users
      resources :songs
      post '/auth', to: 'auth#create'
      # get 'current/user', to: 'auth#show'
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
