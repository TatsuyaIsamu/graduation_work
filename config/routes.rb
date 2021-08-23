Rails.application.routes.draw do
  
  resources :ranking_items
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
  resources :favorite_shintos, only: %i[index create destroy] do
    resources :shinto_params, only: %i[new create destroy]
  end

  root  "tops#index"
  resources :user_introductions, only: %i[show new create edit update destroy]
end
