class AddCurrentPriceToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :currentprice, :decimal
  end
end
