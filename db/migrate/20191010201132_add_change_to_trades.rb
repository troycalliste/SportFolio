class AddChangeToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :change, :decimal
  end
end
