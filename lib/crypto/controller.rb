class Controller

  def initialize
    welcome
    Datascraper.scrape_name
    take_action
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
    puts "What coin would you like to know the price of?"
    puts "Else type 'list' to see the top 10 coins or 'exit'"
    input = gets.chomp.downcase
    if input == "exit"
      puts "Hope you see many gains! Have a nice day."
    elsif input == "list"
      i = 0
      until i == 10
        puts Coin.all[i].name.capitalize
        i += 1
      end
      take_action
    elsif !Coin.all.detect {|coin| coin.name == input}
      puts ""
      puts "Could not find it, please enter it again."
      puts " "
      take_action
    elsif input != "exit"
      individual = Coin.all.detect {|coin| coin.name == input}
      puts ""
      puts "The current price of #{input.capitalize} is #{individual.price}"
      puts ""
      take_action
    end
  end
end


#fucntionality here (top ten coins)
