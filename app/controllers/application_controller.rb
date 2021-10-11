class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :trim_shinto
  layout :layout_by_resource
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  def after_sign_in_path_for(resource)
    home_path # ログイン後に遷移するpathを設定
  end
  def after_sign_up_path_for(resource)
    home_path # ログイン後に遷移するpathを設定
  end
  def layout_by_resource
    if devise_controller?
      "index"
    else
      "application"
    end
  end
  def forbid_login_user
    redirect_to home_path if signed_in?
  end
  def trim_shinto(shinto)
    shinto.origin_shrine.gsub!(/\\n/, "\n")
    shinto.origin_term.gsub!(/\\n/, "\n")
  end
end
