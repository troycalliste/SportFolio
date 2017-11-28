require 'rest-client'
require 'json'
class Company < ApplicationRecord

 def check
  begin
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
  rescue ActionView::Template::Error => e
    retry_attempts += 1
    retry if retry_attempts < 10
    puts "theres an internal server error...".


  end
 end
end



end
