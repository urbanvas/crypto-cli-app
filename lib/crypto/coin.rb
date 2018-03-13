class Coin

  attr_accessor :name, :price

  @@all = []

  def initialize(coin, price)
    @name = coin
    @price = price
    @@all << self if !@@all.include?(self)
  end

  def self.all
    @@all
  end
end
