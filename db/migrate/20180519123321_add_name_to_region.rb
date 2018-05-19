class AddNameToRegion < ActiveRecord::Migration[5.1]
  def change
    add_column :regions, :name, :string
  end
end
