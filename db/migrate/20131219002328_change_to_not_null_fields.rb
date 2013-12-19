class ChangeToNotNullFields < ActiveRecord::Migration
  def change
    change_column :media_types, :name, :string, :null => false
    change_column :tags, :label, :string, :null => false
    change_column :media, :path, :string, :null => false
    change_column :media, :description, :string, :null => false
    change_column :media, :creationtime, :datetime, :null => false
    change_column :tag_instances, :timestamp, :integer, :null => false
    
    sql= "ALTER TABLE tag_instances ADD CONSTRAINT media_id FOREIGN KEY   (media_id) REFERENCES media(id)"
    ActiveRecord::Base.connection.execute(sql)
    sql= "ALTER TABLE tag_instances ADD CONSTRAINT tags_id FOREIGN KEY   (tags_id) REFERENCES tags(id)"
    ActiveRecord::Base.connection.execute(sql)
    sql= "ALTER TABLE media ADD CONSTRAINT media_type_id FOREIGN KEY   (media_type_id) REFERENCES media_types(id)"
    ActiveRecord::Base.connection.execute(sql)

  end
end
