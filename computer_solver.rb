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

    loop do
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

    loop do
      return if @guesses >= 12

      permutations = @fg.permutation.to_a
      mutation = permutations[0]
      result = results(mutation)

      4.times do |i|
        check = mutation.clone
        check[i] = '10'
        check_result = results(check)

        if check_result[0] < result[0]
          # The checked position, was correct, drop all without [x] == [i]
          permutations.keep_if { |x| x[i] == mutation[i] }
        else
          # The checked position was incorrect, drop all with [x] == [i]
          permutations.keep_if { |x| x[i] != mutation[i] }
        end
        @act_guess = @guesses if permutations.uniq.length == 1
        @guesses = 15 if permutations.uniq.length == 1

        break if @guesses >= 12

        @guesses += 1
      end
    end
  end
end

ComputerSolver.new([0, 1, 0, 5])
