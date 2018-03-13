require 'open-uri'
require 'nokogiri'

class Datascraper

  attr_reader :coin_names, :coin_price

  @coin_names = []
  @coin_price = []

  def self.scrape_name(url = 'https://coinmarketcap.com/')
    doc = Nokogiri::HTML(open(url))
    doc.css(".currency-name-container").children.each do |coin|
      @coin_names << coin.text.downcase
    end
    doc.css(".price").children.each do |coin|
      @coin_price << coin.text
    end

    i = 0
    until i == @coin_names.size
      Coin.new(@coin_names[i], @coin_price[i])
      i += 1
    end
  end
end
