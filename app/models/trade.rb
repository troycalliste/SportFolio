class Trade < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :companies

  scope :region_id, -> (region_id) { where region_id: region_id }
  scope :location, -> (location_id) { where location_id: location_id }
  scope :starts_with, -> (name) { where("name like ?", "#{name}%")}



  def tradeprices
    self.tradeprice = self.stockprice * self.volume
    self.save
   end
   def currentprices
     @company = Company.find(self.company_id)
     self.currentprice = @company.currentprice
     self.save
    end
    def uptrades
      self.stockprice > self.currentprice

    end
  
end
