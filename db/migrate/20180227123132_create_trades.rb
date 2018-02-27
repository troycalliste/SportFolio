class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :stock
      t.integer :volume
      t.decimal :stockprice
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
