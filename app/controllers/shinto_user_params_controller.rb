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
  end

  # POST /shinto_user_params or /shinto_user_params.json
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    # binding.irb
    @shinto_user_param = ShintoUserParam.new(shinto_user_param_params)
    @shinto_user_param.shinto_params.build(memo: params[:shinto_user_param][:shinto_param][:memo])
    respond_to do |format|
      if @shinto_user_param.save
        format.js { render :index }
      else
        format.html { redirect_to shintos_path, notice: '投稿できませんでした...' }
      end
    end
  end

  # PATCH/PUT /shinto_user_params/1 or /shinto_user_params/1.json
  def update
    respond_to do |format|
      if @shinto_user_param.update(shinto_user_param_params)
        format.html { redirect_to @shinto_user_param, notice: "Shinto user param was successfully updated." }
        format.json { render :show, status: :ok, location: @shinto_user_param }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shinto_user_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shinto_user_params/1 or /shinto_user_params/1.json
  def destroy
    @shinto_user_param.destroy
    respond_to do |format|
      format.html { redirect_to shinto_user_params_url, notice: "Shinto user param was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shinto_user_param
      @shinto_user_param = ShintoUserParam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shinto_user_param_params
      params.require(:shinto_user_param).permit(:user_id, :shinto_id, shinto_params_attributes: %i[memo])
    end
end
