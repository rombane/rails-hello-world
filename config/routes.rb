Rails.application.routes.draw do
  devise_for :users
  ## get 'greetings/index'
  # root to: 'pages#home'
  
  ## devise_for :users
  get "index", to: "items#index"

  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :purchases, only: [:create]
  end

  resources :purchases, only: [:update, :edit, :index, :show, :destroy]
  resources :items, only: [:update, :edit, :index, :show]
  resources :batches, only: [:create, :update, :index, :edit, :destroy]

  #resources :search_items, only: [:index]
  
  
=begin
   resources :contributors do
    resources :greetings, only: [:create]
  end

  resources :greetings, only: [:show, :edit, :update, :destroy] do
    resources :photos, only: [:create]
    resources :regions, only: [:create]
  end

  resources :photos, only: [:update, :edit, :index, :show, :destroy]
  resources :regions, only: [:index, :show, :destroy] 
=end
end
