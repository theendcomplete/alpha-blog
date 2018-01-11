Rails.application.routes.draw do
  resources :articles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
root 'pages#home'
get 'login', to: 'sessions#new'  
post 'login', to: 'sessions#create'
delete 'logout', to: 'sessions#destroy'
#get 'pages/home', to: 'pages#home'
get 'about', to: 'pages#about'
get 'signup', to: 'users#new'
#get 'users/show', to: 'users/show'
#post 'users', to: 'users#create'
resources :users, except: [:new]
end
