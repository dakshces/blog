Rails.application.routes.draw do
  root 'blogposts#index'
  get 'about', to: 'static_pages#about'
  resources :blogposts
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :tags
end
