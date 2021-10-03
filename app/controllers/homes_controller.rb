class HomesController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @worships = Worship.order(worship_day: :desc).page(params[:page]).per(9)
  end
end
