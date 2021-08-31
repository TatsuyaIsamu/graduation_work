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
    @a = @user_introduction.user.worship_shintos[1].address
    binding.irb
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
