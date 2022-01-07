# frozen_string_literal: true

require 'pry-byebug'
# Class including all game info
class Game
  def initialize
    @number = generate_number
  end

  def choose_input
    puts 'Guess the code the computer chose! (It has 4 digits)'
    guess = gets.chomp
    arr = guess.split('')
    if valid_guess?(arr)
      results = compare_digits(arr)
      return 'winner' if results[0] == 4

      puts "You got #{results[0]} digits exactly right!\n"
      puts "And #{results[1]} of the digits were in the wrong place\n"
      'loser'
    else
      'error'
    end
  end

  private

  def generate_number
    numbers = []
    4.times { numbers << rand(10) }
    numbers
  end

  def valid_guess?(arr)
    arr.length == 4
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
end

guesses = 0
game = Game.new

until guesses > 12
  result = game.choose_input
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
