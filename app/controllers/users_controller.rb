class UsersController < ApplicationController
  def index
    @users = current_user.following.page(params[:page]).per(6)
  end

  def search
    @q = User.ransack(params[:q])
    if params[:q].blank?
      @users = nil
    else
      @users = @q.result(distinct: true)
      @users = Kaminari.paginate_array(@users.reject { |user| user == current_user }).page(params[:page]).per(6)
    end
  end
end
