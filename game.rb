# frozen_string_literal: true

# Class contains the game, and all required info to start solving
class Game
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
    # TD
  end
end
