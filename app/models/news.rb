require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
class News < ApplicationRecord
  def newsupdate
    RestClient.get("https://newsapi.org/v2/top-headlines?sources=cnbc&apiKey=5fd8a5116ff94c548b57d66f1faa1dec") { |response, request, result, &block|
           case response.code
           when 200
             data = JSON.parse(response.body)
             self.content = data["articles"][3]
             # self.title = data["title"]
             self.title = data["articles"][self.id]["title"]
             self.content = data["articles"][self.id]["description"]
             self.imageurl = data["articles"][self.id]["urlToImage"]
             self.publishedon = data["articles"][self.id]["publishedAt"]
             self.long = data["articles"][self.id]["content"]

             puts self.title
             puts self.publishedon

           when 404
             # self.title = "N/a"
            else
             # self.title = "N/a"
            end

  }
  end


  def self.save_data_from_api
    News.all.destroy_all
    RestClient.get("https://newsapi.org/v2/top-headlines?sources=cnbc&apiKey=5fd8a5116ff94c548b57d66f1faa1dec") { |response, request, result, &block|
    data = JSON.parse(response.body)
    @articles = data["articles"]
    @articles.map do |a|
    @new = News.new
    @new.title = a["title"]
    @new.content = a["description"]
    @new.imageurl = a["urlToImage"]
    @new.publishedon = a["publishedAt"]
    @new.long = a["content"]
    @new.save
    end
    }
  end

end
