require_relative 'solving_logic'
require_relative 'input_validation'
require_relative 'text_messages'
require_relative 'human_solver'
require_relative 'game'
require_relative 'computer_solver'

def player
  puts 'Do you want to be the code breaker (1), or the code maker (2)'
  choice = gets.chomp
  case choice
  when '1'
    return 'CPU'
  when '2'
    return 'PLAY'
  else
    puts "I asked you to input 1, or 2. Yeah you're gonna be breaking codes now."
    return 'CPU'
  end
end

Game.new(player)
