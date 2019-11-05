class AddLongToNews < ActiveRecord::Migration[6.0]
  def change
    add_column :news, :long, :text
  end
end
