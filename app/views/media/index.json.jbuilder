json.array!(@media) do |medium|
  json.extract! medium, :title, :id, :description, :path, :media_type_id
  json.url medium_url(medium, format: :json)
end
