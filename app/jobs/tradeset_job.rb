class TradesetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Trade.all.each do |t|
      t.tradeset
      t.save
    end
  end
end
