class AddTopRankToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :toprank, :string
  end
end
