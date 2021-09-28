class UsersController < ApplicationController
  def index
    @users = current_user.following.page(params[:page]).per(6)
  end
  def search
    unless params[:q].blank?
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true).page(params[:page]).per(6)
    else
      @q = User.ransack(params[:q])
      @users = nil
    end
  end
end
