require 'rest-client'
require 'json'
require 'uri'
require 'open-uri'
Company.last(10).each do |c|
  c.tap do |t|
    url = "https://api.iextrading.com/1.0/stock/#{t.ticker}/quote"
    @resource = RestClient::Resource.new( url )
    @response = @resource.get
    data = JSON.parse(@response.body)
    t.change = data["change"]
    t.save
  end
end
