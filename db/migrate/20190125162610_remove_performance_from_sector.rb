class RemovePerformanceFromSector < ActiveRecord::Migration[5.1]
  def change
    remove_column :sectors, :performance, :decimal
  end
end
