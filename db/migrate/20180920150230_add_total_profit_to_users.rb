class AddTotalProfitToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :totalprofit, :decimal
  end
end
