Rails.application.routes.draw do
  root 'users#index'
  resource :user_session, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
end
