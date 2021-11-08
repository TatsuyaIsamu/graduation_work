class UserIntroductionsController < ApplicationController
  before_action :set_user_introduction
  before_action :forbid_other_user_access, only: %i[edit update]
  def show
    3.times do |n|
      ranking = Ranking.find_by(user_id: @user_introduction.user.id, rank: n + 1)
      instance_variable_set("@ranking#{n + 1}", ranking)
    end
    @chart = @user_introduction.origin_chart
    mapping_worship = @user_introduction.worship_mapping
    gon.usermapping = mapping_worship.group_by(&:itself).map { |key, value| [key, value.count] }.unshift(%w[都道府県 回数])
  end

  def edit; end

  def update
    @user_introduction = UserIntroduction.find_by(id: params[:id])
    @user_introduction.update(user_introduction_params)
    redirect_to user_introduction_path(@user_introduction.user.id), notice: 'プロフィールを更新しました'
  end

  private

  def set_user_introduction
    @user_introduction = UserIntroduction.find_by(user_id: params[:id])
  end

  def user_introduction_params
    params.required(:user_introduction).permit(:image,
                                               :introduction).merge(address: params[:user_introduction][:address].to_i)
  end

  def forbid_other_user_access
    if !@user_introduction.nil? && (current_user.user_introduction != @user_introduction)
      redirect_to home_path, alert: 'アクセスできません'
    end
  end
end
