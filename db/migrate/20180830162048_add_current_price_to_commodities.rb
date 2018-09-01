class AddCurrentPriceToCommodities < ActiveRecord::Migration[5.1]
  def change
    add_column :commodities, :currentprice, :decimal
  end
end
