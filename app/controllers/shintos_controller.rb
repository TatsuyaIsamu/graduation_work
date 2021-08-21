class ShintosController < ApplicationController
  before_action :set_shinto, only: %i[ show ]

  # GET /shintos or /shintos.json
  def index
    @shintos = Shinto.all
  end

  # GET /shintos/1 or /shintos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shinto
      @shinto = Shinto.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shinto_params
      params.fetch(:shinto, {})
    end
end
