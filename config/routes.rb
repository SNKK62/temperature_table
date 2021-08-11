Rails.application.routes.draw do
  
  get 'sessions/new'
  get 'groups/index'
  get 'groups/new'
  get 'groups/create'
  
  get 'temperatures/new'
  get 'temperatures/create'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root 'groups#index'
  get '/signup', to: 'groups#new'

  # post 'updatingall', to: 'groups#update_temps'
  
  post "/", to: 'temperatures#update'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  # patch 'groups/:id/sort', to: 'groups#sort'

  resources :groups do
    member do
      post :update_temps
    end
  end

  resources :users  do
    member do
      post :del
      post :higher
      post :lower
    end
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
