class AddRegionIDtoEchange < ActiveRecord::Migration[5.1]
  def change
    add_column :exchanges, :region_id, :integer
  end
end
