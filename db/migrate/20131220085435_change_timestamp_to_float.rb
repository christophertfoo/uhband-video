class ChangeTimestampToFloat < ActiveRecord::Migration
  def change
    change_column :tag_instances, :timestamp, :float
  end
end
