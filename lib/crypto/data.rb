require 'open-uri'
require 'nokogiri'
require 'pry'

class Datascraper

  attr_reader :coin_names, :coin_price, :pairs

  @coin_names = []
  @coin_price = []
  @pairs = {}

  def self.scrape_name(url = 'https://coinmarketcap.com/')
    doc = Nokogiri::HTML(open(url))
    doc.css(".currency-name-container").children.each do |coin|
      @coin_names << coin.text.downcase
    end
    @coin_names
  end

  def self.price(url = 'https://coinmarketcap.com/')
    doc = Nokogiri::HTML(open(url))
    doc.css(".price").children.each do |coin|
      @coin_price << coin.text
    end
    @coin_price
  end

  def self.zipping
    self.scrape_name.each_with_index do |val, ind|
      @pairs[val] = self.price[ind]
    end
    @pairs
  end

  def self.reveal(input)
    @pairs[input]
  end

  def self.pairs
    @pairs
  end


end
