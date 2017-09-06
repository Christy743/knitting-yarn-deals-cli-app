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

  def self.yarn_index
    html = self.get_page
    yarn_array = html.css("div.jcarousel li")
    if yarn_array != nil
    yarn_array.each do |each_skein|
      yarn_ball = KnittingYarnDeals::YarnDeal.new
      yarn_ball.name = each_skein.css("a.titleSmall").text
      yarn_ball.price = each_skein.css("span.costSmall").text.delete(" ").gsub /^\s*/, ''
      yarn_ball.url = "http://www.knitpicks.com#{each_skein.css("a").attribute("href").value}"
      #yarn_ball.url = each_skein.css("a").select { |link| puts "#{link.text}\t#{link['href']}"}
      yarn_ball.availability = true
      #binding.pry
    end
    end
  end

end
