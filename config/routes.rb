Rails.application.routes.draw do
  get 'books/index'

  root to: 'books#index'
  devise_for :users
  resources :users
  resources :book_checkouts
  resources :books
  get '/airdrop', to: 'books#airdrop'
  get '/test_index', to: 'books#test_index'
  get '/about', to: 'books#about'
end
