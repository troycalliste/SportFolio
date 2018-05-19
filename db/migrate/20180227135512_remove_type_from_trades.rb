class RemoveTypeFromTrades < ActiveRecord::Migration[5.1]
  def change
    remove_column :trades, :type, :string
  end
end
