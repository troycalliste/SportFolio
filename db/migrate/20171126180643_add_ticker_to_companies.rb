class AddTickerToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :ticker, :string
    add_column :companies, :otherdata, :string
    remove_column :companies, :name, :string
  end
end
