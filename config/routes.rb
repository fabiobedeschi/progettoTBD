Rails.application.routes.draw do
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :books do
    resources :comments
  end
  resources :authors
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]
end
