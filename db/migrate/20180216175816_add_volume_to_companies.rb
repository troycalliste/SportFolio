class AddVolumeToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :volume, :integer
  end
end
