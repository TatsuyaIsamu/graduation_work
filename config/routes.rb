Rails.application.routes.draw do
  resources :shintos, only: %i[index show]
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'tops/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root  "tops#index"
  resources :user_introductions, only: %i[show new create edit update destroy]
end
