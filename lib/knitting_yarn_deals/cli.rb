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
    #if @skein != nil
    @skein.each.with_index(1) do |yarn, i|
      puts "#{i}. #{yarn.name}"        #{yarn.price}"
    #end
    end
  end

  def menu
    #input = nil
    #while input != "exit"
      puts ""
      puts "Please type in the number from the list of yarn you would like to know more about
      or type in 'list' to see the list again or type 'exit' to end this app:".gsub /^\s*/, ''
      puts ""
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      puts ""
      input = gets.strip.downcase
      if input.to_i > 0
        yarn_deal = @skein[input.to_i-1]
        puts "Description of #{yarn_deal.name}"
        puts "Price of yarn: #{yarn_deal.price}"
        puts "#{yarn_deal.description}"
        puts "Web page address for #{yarn_deal.name}:"
        puts "#{yarn_deal.url}"
          if yarn_deal.description.strip.empty?
            puts "Sorry! There is no description for this yarn."
          #elsif input == "list"
            #list_yarns
          end
          menu
      elsif input == "exit"
        goodbye
      elsif input == "list"
        list_yarns
        menu
      else
        puts "I'm not sure what you are trying to do?"
        menu
      end
  end

  #def menu
  #  input = nil
  #  while input != "exit"

  #  input = gets.strip.downcase
    #puts "Type in the number from the list of yarn you would like to know more about
    #or type 'list' again to see the list of yarns or type 'exit' to end this app:"
  #  if input.to_i > 0 && input.to_i < 11
  #    puts "#{@skein[input.to_i-1].url}"
  #    menu
  #  elsif input == "list"
  #    list_yarns
  #  else
      #puts "Please type 'list' for a list of yarns or type 'exit' to exit this app."
      #menu
  #  end
  #  end
#  end

  def goodbye
    puts "Good Bye and Happy Knitting!"
  end

end
