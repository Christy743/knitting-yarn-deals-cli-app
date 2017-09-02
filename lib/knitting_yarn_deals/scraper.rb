class KnittingYarnDeals::Scraper

  def self.get_page
    html = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/knitting_yarns.html"))
  end



end
