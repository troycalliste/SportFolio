class Trade < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :companies
  has_one :tradeinfo


  scope :region_id, -> (region_id) { where region_id: region_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}



  def tradeprices
    self.tradeprice = self.stockprice * self.volume

   end
  def highslows
       RestClient.get("https://cloud.iexapis.com/v1/stock/#{self.ticker}/quote?token=sk_4e6137c283cb4a209f4bd8ebbe9176f0") { |response, request, result, &block|
              case response.code
              when 200
                data = JSON.parse(response.body)
                self.change = data["changePercent"]
                self.currentprice = data["latestPrice"]
              when 404
                self.change = 0
               else
                self.change = 0
               end
     }
  end
  def self.highall
    Trade.all.each do |t|
      t.highslows
      t.save
    end
  end
   def currentprices   # to get company current price to match trade current price
     if self.company_id
       @company = Company.find(self.company_id)
     elsif self.commodity_id
       @company = Commodity.find(self.commodity_id)
     end

     if @company
      self.currentprice = @company.currentprice
      self.save
     end  #how do we get ALL companies to update...   this only includes the one the trade belongs to
                 # so just run this method on a trade.each do block
    end


    def uptrades
      self.stockprice > self.currentprice
    end
    def tradeset
     self.currenttradeprice = self.currentprice * self.volume
     self.save
    end

end
