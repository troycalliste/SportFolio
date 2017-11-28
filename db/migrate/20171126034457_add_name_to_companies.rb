class AddNameToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :name, :string
    add_column :companies, :change, :decimal
  end
end
