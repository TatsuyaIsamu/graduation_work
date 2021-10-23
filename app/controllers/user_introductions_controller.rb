class UserIntroductionsController < ApplicationController
  before_action :set_user_introduction
  before_action :forbid_other_user_access, only: %i[ edit update ]
  def show
    3.times do |n|
      ranking = Ranking.find_by(user_id: @user_introduction.user.id, rank: n + 1)
      instance_variable_set("@ranking#{n+1}", ranking )
    end
    @chart_shintos = @user_introduction.user.worship_shintos.reject{|shinto| shinto.origin_shrine == "−−−−−"}
    @chart_shintos = @chart_shintos.map do |chart_shinto|
      chart_shinto.origin_shrine.match(/（/)&.pre_match 
    end
    @chart = @chart_shintos.group_by(&:itself).map{|k,v| [k,v.count]}
    if @chart.count <= 5
      dammy = 6 - @chart.count
      dammy.times do |n|
        @chart << ["\n"* n,0]
      end
    end
    mapping_worship = []
    @user_introduction.user.worship_shintos.map do |shinto|
      a = shinto.address.match(/東京都|北海道|(?:京都|大阪)府|.{3}県/).to_s
      a.chop! unless a == "北海道"
      a.slice!(0, 1) if a[0] == "）"
      mapping_worship << a
    end
    gon.usermapping = mapping_worship.group_by(&:itself).map{|key,value| [key,value.count]}.unshift(["都道府県","回数"])
  end
  
  def edit
  end

  def update
    @user_introduction = UserIntroduction.find_by(id: params[:id])
    @user_introduction.update(user_introduction_params)
    redirect_to user_introduction_path(@user_introduction.user.id), notice: "プロフィールを更新しました"
  end

  private
  def set_user_introduction
    @user_introduction = UserIntroduction.find_by(user_id: params[:id])
  end

  def user_introduction_params
    params.required(:user_introduction).permit(:image, :introduction).merge(address: params[:user_introduction][:address].to_i)
  end

  def forbid_other_user_access
    # unless @user_introduction == nil
      if current_user.user_introduction != @user_introduction
        redirect_to home_path, alert: "アクセスできません" 
      end
    # end
  end
end
