Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'tops/index'
  devise_for :users
  root  "tops#index"
  resources :user_introductions, only: %i[show new create edit update destroy]
end
