class UsersController < ApplicationController
  def index
    unless params[:q].blank?
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    else
      @q = User.ransack(params[:q])
      @users = nil
    end
  end

end
