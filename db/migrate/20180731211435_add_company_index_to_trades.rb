class AddCompanyIndexToTrades < ActiveRecord::Migration[5.1]
  def change
     add_index 'trades', ['company_id'], :name => 'trade_company_id' 
  end
end
