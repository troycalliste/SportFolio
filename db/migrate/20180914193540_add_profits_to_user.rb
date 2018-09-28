class AddProfitsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :longprofit, :decimal
    add_column :users, :shortprofit, :decimal
    add_column :users, :commprofit, :decimal
  end
end
