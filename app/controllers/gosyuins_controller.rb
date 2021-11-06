class GosyuinsController < ApplicationController
  def index
    @worships = current_user.worships
  end
end
