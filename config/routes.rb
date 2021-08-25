Rails.application.routes.draw do

    resources :rankings, only: %i[] do
      resources :ranking_items do
        member do
            get :search
        end
      end
    end

  resources :worships do
    collection do
      get :search
    end
  end
  resources :shintos, only: %i[index show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'tops/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:index]
  resources :favorite_shintos, only: %i[index create destroy] do
    resources :shinto_params, only: %i[new create destroy]
  end
  resources :relationships, only: %i[create destroy]

  root  "tops#index"
  resources :conversations do
    resources :messages
  end
  resources :user_introductions, only: %i[show edit update]
end
