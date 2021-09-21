class GosyuinsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @worships = current_user.worships
  end
end