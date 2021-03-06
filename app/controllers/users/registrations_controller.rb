# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :ensure_normal_user, only: :destroy
  skip_before_action :authenticate_user!
  before_action :forbid_login_user
  skip_before_action :forbid_login_user, only: %i[destroy]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    flash.now[:alert] = 'Email と パスワードを入力して下さい' if params[:user][:email].blank? || params[:user][:password].blank?
    super
    unless resource.id.nil?
      a = resource.rankings.build(rank: 1)
      a.ranking_items.build.save
      b = resource.rankings.build(rank: 2)
      b.ranking_items.build.save
      c = resource.rankings.build(rank: 3)
      c.ranking_items.build.save
      resource.build_user_introduction
      resource.save
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    resource.build_user_introduction
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def ensure_normal_user
    redirect_to home_path, alert: 'ゲストユーザーは削除できません。' if resource.email == 'guest@gmail.com'
  end
end
