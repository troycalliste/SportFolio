class AddChangePercentageToCompanies < ActiveRecord::Migration[5.1]
  def change
      add_column :companies, :changepercent, :decimal
  end
end
