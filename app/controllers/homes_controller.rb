class HomesController < ApplicationController
  def index
    @worships = Worship.order(worship_day: :desc).page(params[:page]).per(9)
  end
end
