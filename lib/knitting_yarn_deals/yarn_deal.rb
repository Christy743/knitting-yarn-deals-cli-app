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
  end

  def self.yarn_index
    html = KnittingYarnDeals::Scraper.get_page
    yarn_array = html.css("div.jcarousel li")
    yarn_array.each do |each_skein|
      yarn_ball = KnittingYarnDeals::YarnDeal.new
      yarn_ball.name = each_skein.css("a.titleSmall").text
      yarn_ball.price = each_skein.css("span.costSmall").text
      #yarn_ball.url = "www.knitpicks.com" + each_skein.css("a.titleSmall").first.attr("href").strip
      yarn_ball.availability = true
      @@all << yarn_ball
    end
  end

  def self.yarn_list
    yarn_list = []
    self.all.each do |yarn_ball|
      yarn_list << yarn_ball.name
      binding.pry
    end
  end

end

  #def self.scrape_knit_picks
  #  doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/knitting_yarns.html"))
    #put in the different html tags into this area
    #example: name = doc.search("h2.main-title").text
    #another example: price = doc.search("#todays-deal span.price").text

  #  deal = self.new
  #  deal.name = doc.search("a.titleSmall").text        #"a.titleSmall"
  #  deal.price = doc.search(".costSmall").text   #.gsub(/n\s+/)
    #deal.weight = doc.search(".yarnWeight").text
  #  deal.url = doc.search("a.titleSmall").first.attr("href").strip
  #  deal.availability = true
  #  deal
  #end
