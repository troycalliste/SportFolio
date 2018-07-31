class AddCompanyIdToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :company_id, :integer
  end
end
