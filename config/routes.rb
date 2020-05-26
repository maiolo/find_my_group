Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/questions", to: 'pages#questions'
  resources :profiles
  resources :user_answers, only: [:create, :update] 
end
