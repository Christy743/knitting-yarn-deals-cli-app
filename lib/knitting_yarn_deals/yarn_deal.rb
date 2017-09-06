require 'pry'
class KnittingYarnDeals::YarnDeal
  attr_accessor :name, :price, :availability, :url, :description

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
    @description = description
    @availability = true
    #@@all << self
  end

  def save
    if valid?
      @@all << self
    end
  end

  def valid?
    validate_name
  end

  def validate_name
    !@name.strip.empty?
  end

end
