class AddWalletToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :wallet, :decimal, default: 10000.00
  end
end
