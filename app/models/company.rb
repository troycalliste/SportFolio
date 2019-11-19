require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
# Refresh the cached action_methods when a new action_method is added.
class Company < ApplicationRecord
 has_and_belongs_to_many :trades

 def self.search(search)
   if search
     where('otherdata ilike ? OR ticker ilike ?', "%#{search}%", "#{search}")
   else
     self.where(nil)
   end
 end

 def chngepercntges

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
 def crrntprices

     RestClient.get("https://api.iextrading.com/1.0/tops/last?symbols=#{self.ticker}") { |response, request, result, &block|
            case response.code
            when 200                #revise this to an if else statement.  also maybe put all attribute updates in a single method
              data = JSON.parse(response.body)
              self.currentprice = data[0]["price"].to_f
            when 404
              self.currentprice = 0
             else
              self.currentprice = 0
             end
             self.save
   }
 end
 def self.updatecrrnt
  Company.all.each {|c| c.crrntprices}
 end
 def volume

      RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote") { |response, request, result, &block|
         case response.code
          when 200
               data = JSON.parse(response.body)
               self.volume = data["latestVolume"]
           when 404
               self.volume = 0
              else
               self.volume = 0
          end
    }
  end

  def updatechanges
    @test = Company.order('changepercent DESC').limit(20)
    @test.each do |c|
    # @test.order('changepercent DESC') do |c|
    c.chngepercntges
    c.save
    puts c.name
    end
  end

  def updatecurrentandvol
   @test = Company.all
   @test.find_each(batch_size: 10) do |c|
   # @test.order('changepercent DESC') do |c|
   c.crrntprices
   c.volume
   c.save
   puts c.ticker
   end
  end


 

end
