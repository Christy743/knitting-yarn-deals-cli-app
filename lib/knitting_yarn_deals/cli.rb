require 'pry'
#CLI Controller
class KnittingYarnDeals::CLI

  def call
    system("clear")
    sleep(1)
    hello
    sleep(1)
    list_yarns
    menu
    goodbye
  end

  def hello
    puts ""
    puts "Hello! Check out the yarn deals for your next knitting project."
    puts ""
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts ""
  end

  def list_yarns
    @skein = KnittingYarnDeals::Scraper.this_day
    if @skein != nil
    @skein.each.with_index(1) do |yarn, i|
      puts "#{i}. #{yarn.name}"
    end
    end
  end

  def menu
    input = nil
    puts "Type in the number from the list of yarn you would like to know more about
    or type 'list' again to see the list of yarns or type 'exit' to end this app:".gsub /^\s*/, ''
    puts ""
    while input != "exit"

    input = gets.strip.downcase
    #puts "Type in the number from the list of yarn you would like to know more about
    #or type 'list' again to see the list of yarns or type 'exit' to end this app:"
    if input.to_i > 0 && input.to_i < 11
      puts "#{@skein[input.to_i-1].url}"
      menu
    elsif input == "list"
      list_yarns
    else
      puts "Please type 'list' for a list of yarns or type 'exit' to exit this app."
      #menu
    end
    end
  end

  def goodbye
    puts "Good Bye and Happy Knitting!"
  end

end
