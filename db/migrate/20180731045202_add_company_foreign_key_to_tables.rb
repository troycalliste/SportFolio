class AddCompanyForeignKeyToTables < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :trades, :companies
  end
end
