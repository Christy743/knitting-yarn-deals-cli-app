class KnittingYarnDeals::Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://www.knitpicks.com/yarns/knitting_yarns.html"))

    doc.css("a.titleSmall").each do |y|
      yarn = Yarn.new
      yarn.name = y.css()
  end

  def scrape_knit_picks_index
    self.get_page.css("a.titleSmall")
  end

end
