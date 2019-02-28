class AddNameToSectors < ActiveRecord::Migration[5.1]
  def change
    add_column :sectors, :name, :string
  end
end
