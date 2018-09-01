class AddNameToCommodities < ActiveRecord::Migration[5.1]
  def change
    add_column :commodities, :name, :string
    add_column :commodities, :price, :decimal
  end
end
