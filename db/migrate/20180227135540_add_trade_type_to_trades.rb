class AddTradeTypeToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :tradetype, :string
  end
end
