# frozen_string_literal: true

require 'pry-byebug'
require_relative 'solving_logic.rb'

# Class containing code solving algorithm
class ComputerSolver
  # include InputValidation
  # include TextMessages
  include SolvingLogic

  def initialize(code)
    @code = code
    @guesses = 0
    play
  end

  def play
    @bg = 0
    @fg = []
    @result = []
    @prev_sum = 0
    @sum = 0

    while true
      break if @guesses >= 12

      if @sum > @prev_sum
        delta = @sum - @prev_sum
        delta.times { @fg.push(@bg) }
      end
      break if @sum == 4

      @bg += 1 unless @guesses.zero?
      guess = @fg.clone
      guess.push(@bg) until guess.length == 4

      @prev_sum = @sum
      @result = results(guess)
      @sum = @result.reduce(:+)

      @guesses = 15 if @result[0] == 4
      break if @result[0] == 4

      @guesses += 1
    end

  end
end

ComputerSolver.new([0, 1, 0, 5])
