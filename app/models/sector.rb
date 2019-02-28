class Sector < ApplicationRecord



  def perf

     RestClient.get("https://api.iextrading.com/1.0/stock/market/sector-performance") { |response, request, result, &block|
            case response.code
            when 200
              data = JSON.parse(response.body)
              self.performance = data[self.id - 1]["performance"]
              self.save
             else
              self.performance = 0
              self.save
             end


   }
  end
end
