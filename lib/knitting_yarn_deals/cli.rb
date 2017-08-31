#CLI Controller
class KnittingYarnDeals::CLI

  def call
    puts "Hello! Check out the yarn deals for your next knitting project."
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    list_yarns
    menu
    goodbye
  end

  def list_yarns
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-h
    # puts <<-Doc.gsub /^\s*/, ''
    puts "Yarn deals for your knitting project:"
     @yarn_deal = KnittingYarnDeals::Deal.today
     @yarn_deal.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.weight} - #{deal.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the list number of yarn you want to know more about or type 'list' again to see the list of yarns or type exit:"
    input = gets.strip.downcase

    if input.to_i > 0
      yarns = @yarn_deal[input.to_i-1]
      puts "#{yarns.name} - #{yarns.price} - #{yarns.weight} - #{yarns.availability}"
    elsif input == "list"
      list_yarns
    else
      puts "I am not sure what you want. Please type list or exit."
    end
    end
  end

  def goodbye
    puts "Good Bye and Happy Knitting!"
  end
end
