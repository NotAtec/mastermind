# frozen_string_literal: true

# Class including all game info
class Game

  def initialize
    @numb = generate_number
  end

  private

  def generate_number
    numbers = []
    4.times { numbers << rand(10) }
    numbers.join('')
  end
end

game = Game.new
