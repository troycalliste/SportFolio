require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
# Refresh the cached action_methods when a new action_method is added.
class Company < ApplicationRecord
 has_and_belongs_to_many :trades

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

     RestClient.get("https://api.iextrading.com/1.0/stock/#{self.ticker}/quote") { |response, request, result, &block|
            case response.code
            when 200                #revise this to an if else statement.  also maybe put all attribute updates in a single method
              data = JSON.parse(response.body)
              self.currentprice = data["latestPrice"]
            when 404
              self.currentprice = 0
             else
              self.currentprice = 0
             end

   }
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


 def noko
   @commodity = Commodity.first #crude oil
   doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
    doc.css('.pid-8849-last').each_with_index do |link, i|  # i need to leave myseslf more notes because i have no idea why i used each_with_index here
      if i == 0                                               # i put it there because i couldn't do each do  on a single thing and i needed to use a block   so thats it  just take the first item  aka the 0 index
     @commodity.currentprice = link.content
     @commodity.save
     puts "did it"
      else
        puts "didnt do it"
      end
    end
  end


  def noko2
    @commodity = Commodity.find(2) #gold
    doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
     doc.css('.pid-8830-last').each_with_index do |link, i|
       if i == 0
      @commodity.currentprice = link.content
      @commodity.save
      puts "did it"
       else
         puts "didnt do it"
       end
     end
   end





  def noko3
    @commodity = Commodity.find(3) #silver
    doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
     doc.css('.pid-8836-last').each_with_index do |link, i|
       if i == 0
      @commodity.currentprice = link.content
      @commodity.save
      puts "did it"
       else
         puts "didnt do it"
       end
     end
   end


  def noko4
    @commodity = Commodity.find(4)  #natural gas
    doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
     doc.css('.pid-8862-last').each_with_index do |link, i|
       if i == 0
      @commodity.currentprice = link.content
      @commodity.save
      puts "did it"
       else
         puts "didnt do it"
       end
     end
   end



   def noko5
     @commodity = Commodity.find(5)     #gasoline
     doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
      doc.css('.pid-954867-last').each_with_index do |link, i|
        if i == 0
       @commodity.currentprice = link.content
       @commodity.save
       puts "did it"
        else
          puts "didnt do it"
        end
      end
    end



    def noko6
      @commodity = Commodity.find(6) #copper
      doc = Nokogiri::HTML(open('https://www.investing.com/commodities/real-time-futures'))
       doc.css('.pid-959211-last').each_with_index do |link, i|
         if i == 0
        @commodity.currentprice = link.content
        @commodity.save
        puts "did it"
         else
           puts "didnt do it"
         end
       end
     end

end
