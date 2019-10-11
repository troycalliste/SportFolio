class AddTickerToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :ticker, :string
  end
end
