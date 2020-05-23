Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :profiles
  resources :user_aswers, only: [:create, :update] 
end
