Rails.application.routes.draw do
  resources :articles
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
root 'pages#home'
#get 'pages/home', to: 'pages#home'
get 'about', to: 'pages#about'
end
