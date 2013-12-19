class FixMedium < ActiveRecord::Migration
  def change
    remove_column :media, :creationtime
    add_column :media, :title, :string
  end
end
