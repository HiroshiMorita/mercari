Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :delivery_addresses => 'users/delivery_addresses',
  }

  root 'items#index'

  resources :users, only: [:show, :edit, :update, :create_address] do
    resources :user_addresses, only: [:new, :create, :edit, :update]
  end
  resources :items
  resources :item_comments, only: :create
  resources :categories, only: :index
  resources :brands, only: :index
  resources :user_reviewes, only: [:index, :create]

end
