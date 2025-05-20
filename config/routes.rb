Rails.application.routes.draw do
  resources :posts, only: [ :new, :create, :index, :edit, :update, :destroy ]
  devise_for :users
  root "posts#index"
end
