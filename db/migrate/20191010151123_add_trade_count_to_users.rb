class AddTradeCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tradecount, :string
  end
end
