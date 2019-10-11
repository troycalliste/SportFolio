class AddTabToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :tab, :decimal
  end
end
