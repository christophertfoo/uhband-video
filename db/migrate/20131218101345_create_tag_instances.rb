class CreateTagInstances < ActiveRecord::Migration
  def change
    create_table :tag_instances do |t|
      t.integer :timestamp

      t.timestamps
    end
  end
end
