class HomesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @worships = Worship.all
  end
end
