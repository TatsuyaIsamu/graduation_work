json.array!(@worships) do |event|
  json.extract! event, :id
  json.title event.shinto.name if params[:start] < event.worship_day.to_s && event.worship_day.to_s < params[:end]
  json.start event.worship_day
  json.url worship_url(event, format: :html)
end