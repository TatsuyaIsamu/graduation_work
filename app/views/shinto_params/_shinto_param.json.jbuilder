json.extract! shinto_param, :id, :title, :points, :memo, :favorite_shinto_id, :created_at, :updated_at
json.url shinto_param_url(shinto_param, format: :json)
