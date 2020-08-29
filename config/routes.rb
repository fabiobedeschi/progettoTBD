Rails.application.routes.draw do
  resources :libraries
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#show'

  resources :books do
    resources :comments
  end
  resources :authors
  resources :libraries, only: [:show] do
    get 'edit_authors', on: :member
    patch 'update_authors', on: :member
    get 'edit_books', on: :member
    patch 'update_books', on: :member
  end
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]

  get 'sign_up', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
end
