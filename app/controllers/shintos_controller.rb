class ShintosController < ApplicationController
  before_action :set_shinto, only: %i[ show comment ]

  def index
    @q = Shinto.ransack(params[:q])
    unless params[:q].blank?
      @shintos = @q.result(distinct: true).page(params[:page]).per(7)
      @shintos.map do |shinto|
        shinto.origin_shrine.gsub!(/\\n/, "\n")
      end
    else
      @shintos = nil
    end
  end

  def show
    @shinto_user_params = @shinto.shinto_user_params.order(created_at: :desc).limit(5)
    gon.star_array = []
    @shinto_user_params.each do |user_param|
      user_param.shinto_params.each do |param|
        param.shinto_param_items.each do |item|
          gon.star_array << {"star_count_#{item.id}": item.points}
        end
      end
    end
    @shinto_user_param = @shinto.shinto_user_params.build
    @shinto_params = @shinto_user_param.shinto_params.build
    @shinto_params_items = @shinto_params.shinto_param_items.build
    @shinto.kamisama.gsub!(/\\n/, "<br/>")
    @shinto.origin_shrine.gsub!(/\\n/, "<br/>")
    @hash = Gmaps4rails.build_markers(@shinto) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  def comment
    @shinto_user_params = @shinto.shinto_user_params.page(params[:page]).per(10).order(created_at: :desc)
    gon.star_array = []
    @shinto_user_params.each do |user_param|
      user_param.shinto_params.each do |param|
        param.shinto_param_items.each do |item|
          gon.star_array << {"star_count_#{item.id}": item.points}
        end
      end
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
