Rails.application.routes.draw do
  get 'homes/index'
  get 'temperatures/new'
  get 'temperatures/create'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  root 'homes#index'
  
  post "/", to: 'temperatures#update'
  # get '/temperatures/update'
  resources :users 
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
