require 'pry'
class KnittingYarnDeals::YarnDeal
  attr_accessor :name, :price, :availability, :url

  @@all = []

  def self.all
    @@all
  end

  def initialize
    @name = name
    @price = price
    @url = url
    @availability = availability
    @@all << self
  end

end
