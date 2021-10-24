Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root  "tops#index"
  get "home", to: "homes#index"
  get "gosyuin", to: "gosyuins#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
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
  resources :contacts, only: %i[index new create show]
  resources :worships do
    resources :comments, only: %i[index edit create update destroy]
    collection do
      get :search
      get :calendar
      get :confirm
      get :other_looking
      post :confirm
    end
  end
  resources :shintos, only: %i[index show] do
    member do
      get :comment
    end
  end
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
