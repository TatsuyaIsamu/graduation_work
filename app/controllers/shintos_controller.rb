class ShintosController < ApplicationController
  before_action :set_shinto, only: %i[show comment]
  before_action :gon_star_array_define, only: %i[show comment]

  def index
    @q = Shinto.ransack(params[:q])
    if params[:q].blank?
      @shintos = nil
    else
      @shintos = @q.result(distinct: true).page(params[:page]).per(7)
      @shintos.map do |shinto|
        trim_shinto(shinto)
      end
    end
  end

  def show
    @shinto_user_params = @shinto.shinto_user_params.order(created_at: :desc).limit(5)
    shinto_stars
    @shinto_user_param = @shinto.shinto_user_params.build
    @shinto_params = @shinto_user_param.shinto_params.build
    @shinto_params_items = @shinto_params.shinto_param_items.build
    @shinto.kamisama.gsub!(/\\n/, '<br/>')
    @shinto.origin_shrine.gsub!(/\\n/, '<br/>')
    @hash = Gmaps4rails.build_markers(@shinto) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  def comment
    @shinto_user_params = @shinto.shinto_user_params.page(params[:page]).per(10).order(created_at: :desc)
    shinto_stars
  end

  private

  def set_shinto
    @shinto = Shinto.find(params[:id])
  end

  def shinto_params
    params.fetch(:shinto, {})
  end

  def gon_star_array_define
    gon.star_array = []
  end

  def shinto_stars
    @shinto_user_params.each do |user_param|
      user_param.shinto_params.each do |param|
        param.shinto_param_items.each do |item|
          gon.star_array << { "star_count_#{item.id}": item.points }
        end
      end
    end
  end
end
