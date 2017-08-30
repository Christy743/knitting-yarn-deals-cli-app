class KnittingYarnDeals::Deal
  attr_accessor :name, :price, :weight, :availability, :url
  def self.today
    # I should return a bunch of instances of
    # yarn deals
    # Scrape web sites and return yarn deals based on that data
      #  KnittingYarnDeals::DealScraper.new("https://")
    self.scrape_deals
  end

  def self.scrape_deals
    deals = []

    deals << self.scrape_knit_picks
    deals << self.scrape_love_knitting
    # Go to website, find the product
    # extract the properties
    # instantiate a deal_1

    # Go to website
    # Have an array of data
    # Push the data into the array of 'deals'
    deals

    #deal_1 = self.new
    #deal_1.name = "Yarn 1"
    #deal_1.price = "$5"
    #deal_1.availability = true
    #deal_1.url = "https://"

    #deal_2 = self.new
    #deal_2.name = "Yarn 2"
    #deal_2.price = "$5"
    #deal_2.availability = true
    #deal_2.url = "https://"

    #[deal_1, deal_2]
  end

  def self.scrape_knit_picks
    doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/knitting_yarns.html"))
    #put in the different html tags into this area
    #example: name = doc.search("h2.main-title").text
    #another example: price = doc.search("#todays-deal span.price").text

    deal = self.new
    deal.name = doc.search("div.listImgContainer .title").text
    deal.price = doc.search(".costSmall").text.gsub(/n\s+/)
    deal.weight = doc.search(".yarnWeight").text
    deal.url = doc.search("a.titleSmall").first.attr("href").strip
    deal.availability = true
    deal
    binding.pry
  end

  def self.scrape_love_knitting
    doc = Nokogiri::HTML(open("https://www.loveknitting.com/us/knitting-yarns"))
    #put in the different html tags into this area
    #example: name = doc.search("h2.main-title").text
    #another example: price = doc.search("#todays-deal span.price").text

    deal = self.new
    deal.name = doc.search.css("span.card-title").text.strip
    deal.price = doc.search.css("span.card-price").text.strip
    deal.weight = doc.search.css("em.card-features").text
    deal.availability = true
    deal
  end

end
