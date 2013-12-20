json.extract! @medium, :title, :id, :description, :path, :created_at,:media_type_id, :updated_at
json.media_type @medium.media_type.name
json.tags do
  json.array! @medium.tag_instances do |instance|
    json.id instance.tags.id
    json.label instance.tags.label
    json.timestamp instance.timestamp
  end
end
