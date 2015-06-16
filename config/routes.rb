Rails.application.routes.draw do

  root to: 'books#index'
  devise_for :users
  resources :users
  resources :book_checkouts
  resources :books do
    resources :comments
  end
  get '/airdrop', to: 'books#airdrop'
  get '/test_index', to: 'books#test_index'
  get '/about', to: 'books#about'
  # get 'books/index'
end
