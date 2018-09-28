class AddOneToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :one, :string
  end

end
