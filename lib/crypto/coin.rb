class Coin

  attr_accessor :name, :price

  @@all = []
  @@title = []

  def initialize(coin, price)
    @name = coin
    @price = price
    @@all << self if !@@all.include?(self)
    @@title << coin.downcase if !@@title.include?(coin)
  end

  def self.all
    @@all
  end

  def self.title
    @@title
  end

end
