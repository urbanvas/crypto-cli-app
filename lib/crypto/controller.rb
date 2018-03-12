class Controller

  def initialize
    welcome
    Datascraper.zipping
    take_action
    puts "Hope you see many gains! Have a nice day."
  end

  def welcome
    puts "---------------------------------"
    puts "||       Welcome to your       ||"
    puts "||         F U T U R E         ||"
    puts "---------------------------------"
    puts " "
    puts "...Fetching your information..."
    puts "       Give us a moment."
  end

  def take_action
    puts "what coin would you like to know the price of?"
    input = gets.chomp.downcase
    if Datascraper.pairs.key?(input)
      while input != "exit"
        coin = Datascraper.reveal(input)
        puts "The current price of #{input.capitalize} is #{coin}"
        puts " "
        puts "what coin would you like to know the price of?"
        input = gets.chomp.downcase
      end
    else
      puts "Could not find it, please enter it again."
      puts " "
      take_action
    end
  end
end
