class TopsController < ApplicationController
  skip_before_action :authenticate_user!
  layout "index"
  def index
  end
end
