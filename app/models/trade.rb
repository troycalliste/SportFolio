class Trade < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :companies
  has_and_belongs_to_many :trades

  scope :region_id, -> (region_id) { where region_id: region_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}



  def tradeprices
    self.tradeprice = self.stockprice * self.volume
    self.save
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
end
