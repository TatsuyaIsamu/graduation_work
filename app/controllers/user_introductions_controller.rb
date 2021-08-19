class UserIntroductionsController < ApplicationController
  before_action :set_user_introduction, only: %i[ show edit update destroy ]

  def index
    @user_introductions = UserIntroduction.all
  end

  def show
  end

  def new
    @user_introduction = UserIntroduction.new
  end

  def edit
  end

  def create
    @user_introduction = UserIntroduction.new(user_introduction_params)

    respond_to do |format|
      if @user_introduction.save
        format.html { redirect_to @user_introduction, notice: "User introduction was successfully created." }
        format.json { render :show, status: :created, location: @user_introduction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_introduction.errors, status: :unprocessable_entity }
      end
    end
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

  def destroy
    @user_introduction.destroy
    respond_to do |format|
      format.html { redirect_to user_introductions_url, notice: "User introduction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def set_user_introduction
    @user_introduction = UserIntroduction.find(params[:id])
  end

  def user_introduction_params
    params.fetch(:user_introduction, {})
  end
end
