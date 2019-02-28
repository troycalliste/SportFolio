class AddBuyDateToTradeinfo < ActiveRecord::Migration[5.1]
  def change
    add_column :tradeinfos, :buydate, :datetime
    add_column :tradeinfos, :selldate, :datetime
    add_column :tradeinfos, :stockname, :string
    add_column :tradeinfos, :stockvolume, :integer
  end
end
