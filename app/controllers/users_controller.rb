class UsersController < ApplicationController
  def index
    @users = current_user.following.page(params[:page]).per(6)
  end
  def search
    @q = User.ransack(params[:q])
    unless params[:q].blank?
      @users = @q.result(distinct: true)
      @users = Kaminari.paginate_array(@users.reject{|user| user == current_user}).page(params[:page]).per(6)
    else
      @users = nil
    end
  end
end
