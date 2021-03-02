Rails.application.routes.draw do
  ## get 'greetings/index'
  # root to: 'pages#home'
  
  ## devise_for :users
  get "index", to: "greetings#index"

  root to: "greetings#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :contributors do
    resources :greetings, only: [:create]
  end

  resources :greetings, only: [:show, :edit, :update, :destroy] do
    resources :photos, only: [:create]
    resources :regions, only: [:create]
  end

  resources :photos, only: [:show, :destroy]
  resources :regions, only: [:show, :destroy]
end
