Rails.application.routes.draw do
  get 'books/index'

  root to: 'books#index'
  devise_for :users
  resources :users
  resources :book_checkouts
  resources :books
end
