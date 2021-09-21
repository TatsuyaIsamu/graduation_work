Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root  "tops#index"
  get "home", to: "homes#index"
  get "gosyuin", to: "gosyuins#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :user_introductions, only: %i[show edit update]
  resources :users, only: [:index] do
    collection do
      get :search
    end
  end
  resources :rankings, only: %i[] do
    resources :ranking_items, only: %i[edit update] do
      member do
          get :search
      end
    end
  end
  resources :contacts, only: %i[new create show]
  resources :worships do
    collection do
      get :search
      get :calendar
      get :confirm
      get :other_looking
      post :confirm
    end
  end
  resources :shintos, only: %i[index show]
  resources :favorite_shintos, only: %i[index create destroy] 
  resources :shinto_user_params do
    resources :shinto_param_items 
  end
  resources :relationships, only: %i[create destroy]
  resources :conversations do
    resources :messages
  end
  resources :comments
  resources :favorite_worships, only: %i[create destroy]
end
