require 'pry'
class KnittingYarnDeals::YarnDeal
  attr_accessor :name, :price, :availability, :url

  @@all = []

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def initialize
    @name = name
    @price = price
    @url = url
    @availability = true
    @@all << self
  end

end
