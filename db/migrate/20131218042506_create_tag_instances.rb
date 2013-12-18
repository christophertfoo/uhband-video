class CreateTagInstances < ActiveRecord::Migration
  def change
    create_table :tag_instances do |t|
      t.int :timestamp

      t.timestamps
    end
  end
end
