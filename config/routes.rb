Rails.application.routes.draw do
  root 'shops#index'
  resource :user_session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :shops, only: [:index, :new, :create]
end
