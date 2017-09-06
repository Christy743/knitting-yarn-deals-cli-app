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
    #if yarn_array != nil
    yarn_array.each do |each_skein|
      yarn_ball = KnittingYarnDeals::YarnDeal.new
      yarn_ball.name = each_skein.css("a.titleSmall").text
      yarn_ball.price = each_skein.css("span.costSmall").text.delete(" ").gsub /^\s*/, ''
      yarn_ball.url = "http://www.knitpicks.com#{each_skein.css("a").attribute("href").value}"
      yarn_ball.description = Nokogiri::HTML(open(yarn_ball.url)).css("span.prodDesc").text.delete("").gsub /^\s*/, ''
      #yarn_ball.description = each_skein.css("div#titleAuthor h1 span div.prodPrice").css("div#prodDesc span").text
      #yarn_ball.url = each_skein.css("a").select { |link| puts "#{link.text}\t#{link['href']}"}
      #yarn_ball.description = yarn_ball.url.map { |ind_url|
      #  url = ["http://www.knitpicks.com", ind_url].join()         #titleAuthor
      #  Nokogiri::HTML(open(url)).css("div#titleAuthor h1 span div.prodPrice").css("div#prodDesc span")}.text.split("\n").compact.reject { |i| i.empty? }[0] }
      yarn_ball.availability = true
      yarn_ball.save
      #binding.pry
    #end
    end
  end

  #def self.yarn_description
  #  @yarn_description = Nokogiri::HTML(open(yarn_ball.url))
  #end
      #binding.pry
end
