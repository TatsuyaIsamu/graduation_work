class HomesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @categories = Worship.all
  end
end
