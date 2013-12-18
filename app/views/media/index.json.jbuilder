json.array!(@media) do |medium|
  json.extract! medium, :id, :description, :path, :creationtime
  json.url medium_url(medium, format: :json)
end
