class CreateTradeinfos < ActiveRecord::Migration[5.1]
  def change
    create_table :tradeinfos do |t|

      t.timestamps
    end
  end
end
