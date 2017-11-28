require 'open-uri'
Company.delete_all
open('ftp://ftp.nasdaqtrader.com/SymbolDirectory/nasdaqlisted.txt') do |cos|
  cos.read.each_line do |co|
    ticker, otherdata = co.chomp.split('|')
    Company.create!(ticker: ticker, otherdata: otherdata)
  end
end
open('ftp://ftp.nasdaqtrader.com/SymbolDirectory/otherlisted.txt') do |cos|
  cos.read.each_line do |co|
    ticker, otherdata = co.chomp.split('|')
    Company.create!(ticker: ticker, otherdata: otherdata)
  end
end
