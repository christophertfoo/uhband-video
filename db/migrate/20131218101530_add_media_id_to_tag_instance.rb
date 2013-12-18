class AddMediaIdToTagInstance < ActiveRecord::Migration
  def change
    add_column :tag_instances, :media_id, :integer
  end
end
