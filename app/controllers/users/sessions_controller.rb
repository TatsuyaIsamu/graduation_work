# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :authenticate_user!
  before_action :forbid_login_user
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to home_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
