class AllowPathToBeNull < ActiveRecord::Migration
  def change
    change_column :media, :path, :string, :null => true
  end
end
