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
    @a =
    [
      ['北海道', 3],
      ['青森', 0],
      ['岩手', 0],
      ['宮城', 1],
      ['秋田', 0],
      ['山形', 0],
      ['福島', 0],
      ['茨城', 5],
      ['栃木', 2],
      ['群馬', 2],
      ['埼玉', 29],
      ['千葉', 33],
      ['東京', 797],
      ['神奈川', 50],
      ['新潟', 1],
      ['富山', 2],
      ['石川', 1],
      ['福井', 0],
      ['山梨', 0],
      ['長野', 1],
      ['岐阜', 1],
      ['静岡', 2],
      ['愛知', 10],
      ['三重', 1],
      ['滋賀', 3],
      ['京都', 18],
      ['大阪', 49],
      ['兵庫', 7],
      ['奈良', 4],
      ['和歌山', 2],
      ['鳥取', 0],
      ['島根', 5],
      ['岡山', 0],
      ['広島', 0],
      ['山口', 1],
      ['徳島', 0],
      ['香川', 0],
      ['愛媛', 0],
      ['高知', 0],
      ['福岡', 21],
      ['佐賀', 0],
      ['長崎', 0],
      ['熊本', 0],
      ['大分', 1],
      ['宮崎', 1],
      ['鹿児島', 0],
      ['沖縄', 5]
      ]
  end
  
  def edit
  end

  def update
    respond_to do |format|
      if @user_introduction.update(user_introduction_params)
        format.html { redirect_to @user_introduction, notice: "User introduction was successfully updated." }
        format.json { render :show, status: :ok, location: @user_introduction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_user_introduction
    @user_introduction = UserIntroduction.find_by(id: params[:id])
  end

  def user_introduction_params
    params.required(:user_introduction).permit(:image, :introduction).merge(address: params[:user_introduction][:address].to_i)
    
  end
end
