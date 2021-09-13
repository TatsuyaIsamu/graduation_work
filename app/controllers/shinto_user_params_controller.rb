class ShintoUserParamsController < ApplicationController
  before_action :set_shinto_user_param, only: %i[ show edit update destroy ]

  # GET /shinto_user_params or /shinto_user_params.json
  def index
    @shinto_user_params = ShintoUserParam.all
  end

  # GET /shinto_user_params/1 or /shinto_user_params/1.json
  def show
  end

  # GET /shinto_user_params/new
  def new
    @shinto_user_param = ShintoUserParam.new
  end

  # GET /shinto_user_params/1/edit
  def edit
    @shinto_user_param = ShintoUserParam.find(params[:id])
    binding.pry
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end
  # POST /shinto_user_params or /shinto_user_params.json
  def create

    @shinto_user_param = ShintoUserParam.new(user_id: params[:shinto_user_param][:user_id], shinto_id: params[:shinto_user_param][:shinto_id])
    @a = @shinto_user_param.shinto_params.build(memo: params[:shinto_user_param][:shinto_params_attributes]["0"][:memo])
    @b = params[:shinto_user_param][:shinto_params_attributes]["0"]
    @b[:shinto_param_items_attributes].each do |key, value|
      @a.shinto_param_items.build(title: value[:title], points: value[:points])
    end
    respond_to do |format|
      if @shinto_user_param.save
        format.js { render :index }
      else
        format.html { redirect_to shintos_path, notice: '投稿できませんでした...' }
      end
    end
  end

  def update
    @shinto_user_params = ShintoUserParam.find(params[:id])
      respond_to do |format|
        if @shinto_user_params.shinto_params.update(memo:  params[:shinto_user_param][:shinto_param][:memo])
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @shinto_user_params = ShintoUserParam.find(params[:id])
    @shinto_user_params.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shinto_user_param
      @shinto_user_param = ShintoUserParam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shinto_user_param_params
      params.require(:shinto_user_param).permit(:user_id, :shinto_id, shinto_params_attributes: [:memo, shinto_param_items_attributes: [:title, :points]])
      binding.irb
    end
end
