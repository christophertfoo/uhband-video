json.array!(@tags) do |tag|
  json.extract! tag, :id, :label
  json.url tag_url(tag, format: :json)
end
