class AddPublishedOnToNews < ActiveRecord::Migration[5.1]
  def change
    add_column :news, :publishedon, :datetime
  end
end
