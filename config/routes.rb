Rails.application.routes.draw do
  root 'users#index'
  resource :user_session, only: [:new, :create, :destroy]
end
