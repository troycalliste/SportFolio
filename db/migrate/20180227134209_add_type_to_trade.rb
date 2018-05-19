class AddTypeToTrade < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :type, :string
  end
end
