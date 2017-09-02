require 'pry'
#CLI Controller
class KnittingYarnDeals::CLI

  def call
    hello
    list_yarns
    menu
    goodbye
  end

  def hello
    puts ""
    puts "Hello! Check out the yarn deals for your next knitting project."
    puts ""
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts ""
  end

  def list_yarns
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-h
    # puts <<-Doc.gsub /^\s*/, ''
    KnittingYarnDeals::YarnDeal.yarn_index
    KnittingYarnDeals::YarnDeal.yarn_list
  end

  def menu
    input = nil
    while input != "exit"
      puts "Type in the number from the list of yarn you would like to know more about
      or type 'list' again to see the list of yarns or type 'exit' to end this app:"
    input = gets.strip.downcase

    if input.to_i > 0

      puts "yarn of your choice"
    #  yarns = @yarn_deal[input.to_i-1]
      #puts "#{yarns.name} - #{yarns.price} - #{yarns.weight} - #{yarns.availability}"
    elsif input == "list"
      list_yarns
    else
      puts "Please type 'list' for a list of yarns or type 'exit' to exit this app."
    end
    end
  end

  def goodbye
    puts "Good Bye and Happy Knitting!"
  end

end
