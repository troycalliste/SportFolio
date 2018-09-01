class CreateJoinTableTradesCommodities < ActiveRecord::Migration[5.1]
  def change
    create_join_table :trades, :commodities do |t|
      # t.index [:trade_id, :commodity_id]
      # t.index [:commodity_id, :trade_id]
    end
  end
end
