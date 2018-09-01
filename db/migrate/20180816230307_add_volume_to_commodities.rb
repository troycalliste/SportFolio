class AddVolumeToCommodities < ActiveRecord::Migration[5.1]
  def change
    add_column :commodities, :volume, :integer
  end
end
