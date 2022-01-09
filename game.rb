# frozen_string_literal: true

# Class contains the game, and all required info to start solving
class Game
  include TextMessages
  include InputValidation

  def initialize(maker)
    @maker = maker
    @code = @maker == 'CPU' ? generate_code : input_code
    @maker == 'CPU' ? HumanSolver.new(@code) : ComputerSolver.new(@code)
  end

  private

  def generate_code
    code = []
    4.times { code << rand(10) }
    code
  end

  def input_code
    code = ''
    until valid_code?(code)
      request_input
      code = gets.chomp
      code = code.split('')
      code.map!(&:to_i)
    end
    code
  end
end
