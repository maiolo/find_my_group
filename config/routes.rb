Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/questions", to: 'pages#questions'
  resources :profiles
  resources :user_answers, only: [:create, :update] 
  resources :user_interactions, only: [:create]
  resources :groups, only: [:index, :show, :create, :edit, :destroy] do
    resources :group_members, only: [:index, :create, :destroy]
  end
end
