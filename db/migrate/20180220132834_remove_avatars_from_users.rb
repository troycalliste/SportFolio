class RemoveAvatarsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatars, :string
  end
end
