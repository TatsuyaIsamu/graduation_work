class RankingItemsController < ApplicationController
  before_action :set_ranking_item, only: %i[ show edit update destroy ]

  # GET /ranking_items or /ranking_items.json
  def index
    @ranking_items = RankingItem.all
  end

  # GET /ranking_items/1 or /ranking_items/1.json
  def show
  end

  # GET /ranking_items/new
  def new
    @ranking_item = RankingItem.new
  end

  # GET /ranking_items/1/edit
  def edit
  end

  # POST /ranking_items or /ranking_items.json
  def create
    @ranking_item = RankingItem.new(ranking_item_params)

    respond_to do |format|
      if @ranking_item.save
        format.html { redirect_to @ranking_item, notice: "Ranking item was successfully created." }
        format.json { render :show, status: :created, location: @ranking_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ranking_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranking_items/1 or /ranking_items/1.json
  def update
    respond_to do |format|
      if @ranking_item.update(ranking_item_params)
        format.html { redirect_to @ranking_item, notice: "Ranking item was successfully updated." }
        format.json { render :show, status: :ok, location: @ranking_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ranking_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranking_items/1 or /ranking_items/1.json
  def destroy
    @ranking_item.destroy
    respond_to do |format|
      format.html { redirect_to ranking_items_url, notice: "Ranking item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ranking_item
      @ranking_item = RankingItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ranking_item_params
      params.require(:ranking_item).permit(:shinto_id, :ranking_id)
    end
end
