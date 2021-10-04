class ShintoParamItemsController < ApplicationController
  before_action :set_shinto_param_item, only: %i[ show edit update destroy ]

  # GET /shinto_param_items or /shinto_param_items.json
  def index
    @shinto_param_items = ShintoParamItem.all
  end

  # GET /shinto_param_items/1 or /shinto_param_items/1.json
  def show
  end

  # GET /shinto_param_items/new
  def new
    @shinto_param_item = ShintoParamItem.new
  end

  # GET /shinto_param_items/1/edit
  def edit
  end

  # POST /shinto_param_items or /shinto_param_items.json
  def create
    @shinto_param_item = ShintoParamItem.new(shinto_param_item_params)

    respond_to do |format|
      if @shinto_param_item.save
        format.html { redirect_to @shinto_param_item, notice: "Shinto param item was successfully created." }
        format.json { render :show, status: :created, location: @shinto_param_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shinto_param_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shinto_param_items/1 or /shinto_param_items/1.json
  def update
    respond_to do |format|
      if @shinto_param_item.update(shinto_param_item_params)
        format.html { redirect_to @shinto_param_item, notice: "Shinto param item was successfully updated." }
        format.json { render :show, status: :ok, location: @shinto_param_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shinto_param_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shinto_param_items/1 or /shinto_param_items/1.json
  def destroy
    @shinto_param_item.destroy
    respond_to do |format|
      format.html { redirect_to shinto_param_items_url, notice: "Shinto param item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shinto_param_item
      @shinto_param_item = ShintoParamItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shinto_param_item_params
      params.require(:shinto_param_item).permit(:title, :points, :shinto_params_id)
    end
end
