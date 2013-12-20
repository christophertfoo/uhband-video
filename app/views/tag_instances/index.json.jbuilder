json.array!(@tag_instances) do |tag_instance|
  json.extract! tag_instance, :id, :timestamp, :media_id, :tags_id
  json.url tag_instance_url(tag_instance, format: :json)
end
