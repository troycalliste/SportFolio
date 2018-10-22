class TradesetJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Trade.each do |t|
      t.tradeset
    end
  end
end
