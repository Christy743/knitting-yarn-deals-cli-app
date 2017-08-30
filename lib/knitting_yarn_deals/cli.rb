#CLI Controller
class KnittingYarnDeals::CLI

  def call
    puts "Knitting yarn deals:"
    list_deals
    menu
    goodbye
  end

  def list_deals
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-h
    puts <<-Doc.gsub /^\s*/, ''
    1. knitpicks
    2. loveknitting
    Doc
    @yarn_deal = KnittingYarnDeals::Deal.today
    @yarn_deal.each.with_index(1) do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.availability}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the yarn you want to know more about
      or see the list again or type exit:"
    input = gets.strip.downcase

    if input.to_i > 0
      puts @yarn_deal[input.to_i-1]
    elsif input == "list"
      list_deals
    else
      puts "Not sure what you want. Type list or exit."
    end
    end
  end

  def goodbye
    puts "See you later!"
  end
end
