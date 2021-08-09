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

  post '/updatingall', to: 'groups#update_temps'
  
  post "/", to: 'temperatures#update'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :groups 
   

  resources :users  do
    member do
      post :del
    end
  end
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
