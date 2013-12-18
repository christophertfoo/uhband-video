class AddTagIdToTagInstance < ActiveRecord::Migration
  def change
    add_column :tag_instances, :tags_id, :integer
  end
end
