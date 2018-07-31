class CreateJoinTableCompanyTrade < ActiveRecord::Migration[5.1]
  def change
    create_join_table :companies, :trades do |t|
      # t.index [:company_id, :trade_id]
      # t.index [:trade_id, :company_id]
    end
  end
end
