class ShintoParamsController < ApplicationController
  before_action :set_shinto_param, only: %i[ show edit update destroy ]

  # GET /shinto_params or /shinto_params.json
  def index
    @shinto_params = ShintoParam.all
  end

  # GET /shinto_params/1 or /shinto_params/1.json
  def show
  end

  # GET /shinto_params/new
  def new
    @shinto_param = ShintoParam.new
    # @favorite_shinto_id = params[:favorite_shinto_id]
    @favorite_shinto = FavoriteShinto.find(params[:favorite_shinto_id])
    binding.irb
  end

  # GET /shinto_params/1/edit
  def edit
  end

  # POST /shinto_params or /shinto_params.json
  def create

    @shinto_param = ShintoParam.new(shinto_param_params)
    @favorite_shinto = FavoriteShinto.find(params[:favorite_shinto_id])
    respond_to do |format|
      if @shinto_param.save
        format.html { redirect_to favorite_shintos_path, notice: "Shinto param was successfully created." }
        format.json { render :show, status: :created, location: @shinto_param }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shinto_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shinto_params/1 or /shinto_params/1.json
  def update
    respond_to do |format|
      if @shinto_param.update(shinto_param_params)
        format.html { redirect_to @shinto_param, notice: "Shinto param was successfully updated." }
        format.json { render :show, status: :ok, location: @shinto_param }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shinto_param.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shinto_params/1 or /shinto_params/1.json
  def destroy
    @shinto_param.destroy
    respond_to do |format|
      format.html { redirect_to shinto_params_url, notice: "Shinto param was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shinto_param
      @shinto_param = ShintoParam.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shinto_param_params
      params.require(:shinto_param).permit(:title, :points, :memo, :favorite_shinto_id)
    end
end
