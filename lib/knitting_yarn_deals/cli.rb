class KnittingYarnDeals::CLI

  def call
    system("clear")
    sleep(1)
    hello
    sleep(1)
    list_yarns
    menu
  end

  def hello
    puts ""
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts ""
    puts "Hello! Check out this yarn list for your next knitting project:"
    puts ""
  end

  def list_yarns
    @skein = KnittingYarnDeals::Scraper.this_day
    @skein.each.with_index(1) do |yarn, i|
      puts "#{i}. #{yarn.name}"
    end
  end

  def menu
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      puts ""
      puts "Please type in the number from the list of yarn you would like to know more about
      or type in 'list' to see the list of yarn again or type 'exit' to end this app:".gsub /^\s*/, ''
      puts ""
      puts ""
      input = gets.strip
      if input.to_i > 0
        yarn_deal = @skein[input.to_i-1]
        puts "Description of #{yarn_deal.name}"
        puts "Price of yarn: #{yarn_deal.price}"
        puts "#{yarn_deal.description}"
        puts "Web page address for #{yarn_deal.name}:"
        puts "#{yarn_deal.url}"
          if yarn_deal.description.strip.empty?
            puts ""
            puts "Sorry! There is no description for this yarn."
          end
          menu
      elsif input == "exit"
        goodbye
      elsif input == "list"
        list_yarns
        menu
      else
        puts "I'm not sure what you want."
        menu
      end
  end

  def goodbye
    puts "Good Bye and Happy Knitting!"
  end

end
