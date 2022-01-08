# frozen_string_literal: true

require 'pry-byebug'
# Class including all game info
class Game
  def initialize
    @number = generate_number
  end

  def compare_digits(arr)
    correct = 0
    close = 0

    arr.each_with_index do |v, idx|
      correct += 1 if v.to_i == @number[idx]
      close += 1 if @number.include?(v.to_i) && v.to_i != @number[idx]
    end
    [correct, close]
  end

  private

  def generate_number
    numbers = []
    4.times { numbers << rand(10) }
    numbers
  end
end

# Class including all rules & checks for player input
class Rules
  def self.choose_input(game)
    puts 'Guess the code the computer chose! (It has 4 digits)'
    guess = gets.chomp
    arr = guess.split('')
    if valid_guess?(arr)
      results = game.compare_digits(arr)
      return 'winner' if results[0] == 4

      show_results(results)
    else
      'error'
    end
  end

  class << self
    private

    def valid_guess?(arr)
      arr.length == 4
    end

    def show_results(results)
      puts "You got #{results[0]} digits exactly right!\n"
      puts "And #{results[1]} of the digits were in the wrong place\n"
      'loser'
    end
  end
end

guesses = 0
game = Game.new

until guesses > 12
  result = Rules.choose_input(game)
  case result
  when 'winner'
    puts 'You have chosen the correct code! Congrats'
    break
  when 'loser'
    if guesses == 12
      puts 'You lost! Better luck next time!'
    else
      puts 'Try Again!'
      guesses += 1
    end
  when 'error'
    puts 'Please input 4 digits!'
  end
end
