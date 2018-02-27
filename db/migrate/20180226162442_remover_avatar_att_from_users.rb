class RemoverAvatarAttFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :users, :avatar
  end
end
