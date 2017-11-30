require 'rest-client'
require 'json'
class Company < ApplicationRecord

   def check

     RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote") { |response, request, result, &block|
            case response.code
            when 200
              data = JSON.parse(response.body)
              self.name = data["companyName"]
            when 404
              self.name = "n/a"
             else
              self.name = "n/a"
             end

   }
   end


 def checktwo

   RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote") { |response, request, result, &block|
          case response.code
          when 200
            data = JSON.parse(response.body)
            self.change = data["change"]
          when 404
            self.change = 0
           else
            self.change = 0
           end

 }
 end


 def checkthree

   RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote") { |response, request, result, &block|
          case response.code
          when 200
            data = JSON.parse(response.body)
            self.changepercent = data["changePercent"]
          when 404
            self.changepercent = 0
           else
            self.changepercent = 0
           end

 }
  end
end
