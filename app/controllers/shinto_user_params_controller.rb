class ShintoUserParamsController < ApplicationController
  respond_to? :js
  def create
    @shinto_user_param = ShintoUserParam.new(user_id: params[:shinto_user_param][:user_id],
                                             shinto_id: params[:shinto_user_param][:shinto_id])
    a = @shinto_user_param.shinto_params.build(memo: params[:shinto_user_param][:shinto_params_attributes]['0'][:memo])
    b = params[:shinto_user_param][:shinto_params_attributes]['0']
    @c = []
    b[:shinto_param_items_attributes].each do |_key, value|
      @c << a.shinto_param_items.build(title: value[:title], points: value[:points])
    end
    if @c.map(&:title).all?(&:empty?) & @c.map(&:points).all?(&:nil?) & a.memo.empty?
      @shinto_user_params = Shinto.find_by(id: params[:shinto_user_param][:shinto_id]).shinto_user_params.order(created_at: :desc).limit(5)
      flash.now[:notice] = '空欄です'
    else
      @shinto_user_param.save
      @shinto_user_params = @shinto_user_param.shinto.shinto_user_params.order(created_at: :desc).limit(5)
      flash.now[:notice] = 'レビューを投稿しました'
    end
    gon.star_array = []
    @shinto_user_params.each do |user_param|
      user_param.shinto_params.each do |param|
        param.shinto_param_items.each do |item|
          gon.star_array << { "star_count_#{item.id}": item.points }
        end
      end
    end
    render :index
  end

  def destroy
    @shinto_user_param = ShintoUserParam.find(params[:id])
    @shinto = Shinto.find_by(id: @shinto_user_param.shinto_id)
    @shinto_user_param_id = @shinto_user_param.id
    @shinto_user_param.destroy
    @shinto_user_params = @shinto.shinto_user_params
    gon.star_array = []
    @shinto_user_params.each do |user_param|
      user_param.shinto_params.each do |param|
        param.shinto_param_items.each do |item|
          gon.star_array << { "star_count_#{item.id}": item.points }
        end
      end
    end
    flash.now[:notice] = 'コメントを削除しました'
  end
end
