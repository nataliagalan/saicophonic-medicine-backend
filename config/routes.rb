Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :videos
      resources :users
      resources :songs
      post '/auth', to: 'auth#create'
      get 'current_user', to: 'auth#show'
      get 'videos/search/:query', to: 'videos#search', as: :search
      # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    end
  end
end
