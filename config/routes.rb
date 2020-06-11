Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/questions", to: 'pages#questions'
  get "/liked_by", to: 'pages#liked_by'
  resources :profiles
  resources :user_answers, only: [:create, :update]
  resources :user_interactions, only: [:create]
  resources :groups, only: [:index, :show, :create, :edit, :update, :destroy] do
    resources :group_members, only: [:index, :create, :destroy]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
