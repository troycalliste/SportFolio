class AddCurrentPriceToTradeinfos < ActiveRecord::Migration[5.1]
  def change
    add_column :tradeinfos, :currentprice, :decimal
  end
end
