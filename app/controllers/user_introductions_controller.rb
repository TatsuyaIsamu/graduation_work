class UserIntroductionsController < ApplicationController
  before_action :set_user_introduction, only: %i[ show edit update ]

  def show
    ranking_user_id = @user_introduction.user.id
    @ranking1 = Ranking.find_by(user_id: ranking_user_id, rank: 1)
    @ranking2 = Ranking.find_by(user_id: ranking_user_id, rank: 2)
    @ranking3 = Ranking.find_by(user_id: ranking_user_id, rank: 3)
    @chart_shinto = @user_introduction.user.worship_shintos.reject{|shinto| shinto.origin_shrine == "−−−−−"}
    @chart_shinto = @chart_shinto.group_by{|i| i.origin_shrine}
    @chart = []
    @chart_shinto.each do |shinto|
      arr = []
      arr[0] = shinto[0]
      arr[1] = shinto[1].count
      @chart << arr
    end
    if @chart.count <= 5
      dammy = 6 - @chart.count
      dammy.times do |n|
        @chart << ["\n"* n,0]
      end
    end
    mapping_worship = []
    @user_introduction.user.worship_shintos.map do |shinto|
      a = shinto.address.match(/東京都|北海道|(?:京都|大阪)府|.{3}県/).to_s
      unless a == "北海道"
        a.chop!
      end
      if a[0] == "）"
        a.slice!(0, 1)
      end
      mapping_worship << a
    end
    mapping_count = mapping_worship.group_by(&:itself).map{|key,value| [key,value.count]}
    mapping_count.unshift(["都道府県","回数"])
    gon.usermapping = mapping_count
  end
  
  def edit
  end

  def update
    @user_introduction.update(user_introduction_params)
    redirect_to @user_introduction, notice: "プロフィールを更新しました"
  end

  private
  def set_user_introduction
    @user_introduction = UserIntroduction.find_by(id: params[:id])
  end

  def user_introduction_params
    params.required(:user_introduction).permit(:image, :introduction).merge(address: params[:user_introduction][:address].to_i)
  end
end
