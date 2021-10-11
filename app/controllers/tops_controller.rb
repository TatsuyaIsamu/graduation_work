class TopsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :forbid_login_user
  layout "index"
  def index
  end

end
