class AddTextToTitle < ActiveRecord::Migration[5.1]
  def change
    add_column :titles, :text, :string
  end
end
