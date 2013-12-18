class AddMediaTypeIdToMedia < ActiveRecord::Migration
  def change
    add_column :media, :media_type_id, :integer
  end
end
