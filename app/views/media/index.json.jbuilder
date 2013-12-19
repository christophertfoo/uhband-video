json.array!(@media) do |medium|
  json.extract! medium, :title, :id, :description, :path
  json.url medium_url(medium, format: :json)
end
