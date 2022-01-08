# frozen_string_literal: true

require 'pry-byebug'
# Module with logic for both human & computer solving
module SolvingLogic
  def results(guess)
    temp_g = guess.clone
    temp_m = @code.clone
    exact = exact(temp_g, temp_m)
    close = close(temp_g, temp_m)

    [exact, close]
  end

  def exact(guess, code)
    exact = 0
    code.each_with_index do |digit, index|
      next unless digit == guess[index].to_i

      exact += 1
      code[index] = '*'
      guess[index] = '*'
    end
    exact
  end

  def close(guess, code)
    close = 0
    code.each do |digit|
      next if digit == '*'

      close += 1 if guess.include?(digit.to_s)
    end
    close
  end
end

# Methods checking if player input is allowed
module InputValidation
  def valid_guess?(guess)
    guess.length == 4
  end
end

# Methods that output text on the screen
module TextMessages
  def guess_error
    puts 'Please input a 4 digit number, containing only numeric characters!'
  end

  def guess_prompt
    puts 'Guess the code the computer chose! (It has 4 digits)'
  end
end

# Class containing logic for solving human
class HumanSolver
  include InputValidation
  include TextMessages
  include SolvingLogic

  def initialize(code)
    @code = code
    play
  end

  def play
    p @code
    p attempt
  end

  def attempt
    guess = player_guess
    valid_guess?(guess) ? results(guess) : guess_error
  end

  def player_guess
    guess_prompt
    gets.chomp.split('')
  end
end

class ComputerSolver
end

# Class contains the game, and all required info to start solving
class Game
  def initialize(maker)
    @maker = maker
    @code = @maker == 'CPU' ? generate_code : input_code
    @maker == 'CPU' ? HumanSolver.new(@code) : ComputerSolver.solve(@code)
  end

  def generate_code
    code = []
    4.times { code << rand(10) }
    code
  end

  def input_code
    # TD
  end
end

Game.new('CPU')
