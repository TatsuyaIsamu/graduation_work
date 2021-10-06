class UsersController < ApplicationController
  def index
    @users = current_user.following.page(params[:page]).per(6)
  end
  def search
    @q = User.ransack(params[:q])
    unless params[:q].blank?
      @users = @q.result(distinct: true).page(params[:page]).per(6)
    else
      @users = nil
    end
  end
end
