class ShintosController < ApplicationController
  before_action :set_shinto, only: %i[ show ]

  def index
    unless params[:q].blank?
      @q = Shinto.ransack(params[:q])
      @shintos = @q.result(distinct: true).page(params[:page]).per(7)
    else
      @q = Shinto.ransack(params[:q])
      @shintos = nil
    end
  end

  def show
    @shinto.kamisama.gsub!(/\\n/, "<br/>")
    @shinto.origin_shrine.gsub!(/\\n/, "<br/>")
    @hash = Gmaps4rails.build_markers(@shinto) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  private
  def set_shinto
    @shinto = Shinto.find(params[:id])
  end

  def shinto_params
    params.fetch(:shinto, {})
  end
end
