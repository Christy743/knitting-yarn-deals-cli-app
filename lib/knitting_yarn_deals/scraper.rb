class KnittingYarnDeals::Scraper

  def self.get_page
    html = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/knitting_yarns.html"))
  end

  def self.this_day
    if KnittingYarnDeals::YarnDeal.all == []
      self.yarn_index
      KnittingYarnDeals::YarnDeal.all
    else
      KnittingYarnDeals::YarnDeal.all
    end
  end

  def self.scrape_details(yarn_ball, index)
    skein = @yarn_array[index]

    yarn_ball.price = skein.css("span.costSmall").text.delete(" ").gsub /^\s*/, ''
    yarn_ball.url = "http://www.knitpicks.com#{skein.css("a").attribute("href").value}"
    yarn_ball.description = Nokogiri::HTML(open(yarn_ball.url)).css("div#prodDesc span.prodDesc").text.gsub /^\s*/, ' '
    yarn_ball.availability = true
  end

  def self.yarn_index
    html = self.get_page
    @yarn_array = html.css("div.jcarousel li")
    @yarn_array.each do |each_skein|
      yarn_ball = KnittingYarnDeals::YarnDeal.new
      yarn_ball.name = each_skein.css("a.titleSmall").text
      yarn_ball.save
    end
  end

end
