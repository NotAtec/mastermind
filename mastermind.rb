# frozen_string_literal: true

# Class including all game info
class Game

  def initialize
    @number = generate_number
  end

  def choose_input
    puts 'Guess the code the computer chose! (It has 4 digits)'
    guess = gets.chomp
    arr = guess.split('')

    compare_digits(arr)
  end

  private

  def generate_number
    numbers = []
    4.times { numbers << rand(10) }
    numbers
  end

  def compare_digits(arr)
  end
end

game = Game.new
