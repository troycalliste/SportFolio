class AddCurrentTradePriceToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :currenttradeprice, :decimal
  end
end
