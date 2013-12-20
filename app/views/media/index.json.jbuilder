json.array!(@media) do |medium|
  json.extract! medium, :title, :id, :description, :path, :created_at
  json.media_type medium.media_type.name
  json.url medium_url(medium, format: :json)
end
