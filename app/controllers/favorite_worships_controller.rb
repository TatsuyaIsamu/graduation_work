class FavoriteWorshipsController < ApplicationController
  before_action :set_favorite_worship, only: %i[ show edit update destroy ]

  # GET /favorite_worships or /favorite_worships.json
  def index
    @favorite_worships = FavoriteWorship.all
  end

  # GET /favorite_worships/1 or /favorite_worships/1.json
  def show
  end

  # GET /favorite_worships/new
  def new
    @favorite_worship = FavoriteWorship.new
  end

  # GET /favorite_worships/1/edit
  def edit
  end

  # POST /favorite_worships or /favorite_worships.json
  def create
    @favorite_worship = FavoriteWorship.new(favorite_worship_params)

    respond_to do |format|
      if @favorite_worship.save
        format.html { redirect_to @favorite_worship, notice: "Favorite worship was successfully created." }
        format.json { render :show, status: :created, location: @favorite_worship }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favorite_worship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favorite_worships/1 or /favorite_worships/1.json
  def update
    respond_to do |format|
      if @favorite_worship.update(favorite_worship_params)
        format.html { redirect_to @favorite_worship, notice: "Favorite worship was successfully updated." }
        format.json { render :show, status: :ok, location: @favorite_worship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite_worship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_worships/1 or /favorite_worships/1.json
  def destroy
    @favorite_worship.destroy
    respond_to do |format|
      format.html { redirect_to favorite_worships_url, notice: "Favorite worship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_worship
      @favorite_worship = FavoriteWorship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_worship_params
      params.require(:favorite_worship).permit(:user_id, :shinto_id)
    end
end
