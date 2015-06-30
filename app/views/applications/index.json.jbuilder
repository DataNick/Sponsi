json.array!(@applications) do |application|
  json.extract! application, :id, :name, :sport, :rank
  json.url application_url(application, format: :json)
end
