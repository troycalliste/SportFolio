class LatestnewsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    News.all.each do |n|
      n.newsupdate
      n.save
    end
  end
end
