class AddTradePriceToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :tradeprice, :decimal
  end
end
