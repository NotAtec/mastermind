# frozen_string_literal: true

require 'pry-byebug'
require_relative 'solving_logic.rb'
require_relative 'text_messages.rb'

# Class containing code solving algorithm
class ComputerSolver
  include TextMessages
  include SolvingLogic

  def initialize(code)
    @code = code
    @guesses = 1
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

      @bg += 1 unless @guesses == 1
      guess = @fg.clone
      guess.push(@bg) until guess.length == 4

      @prev_sum = @sum
      @result = results(guess)
      @sum = @result.reduce(:+)

      if @result[0] == 4
        computer_win(@guesses)
        @guesses = 15
        break
      end

      @guesses += 1
    end

    loop do
      break if @guesses >= 12

      permutations = @fg.permutation.to_a
      mutation = permutations[0]
      result = results(mutation)

      4.times do |i|
        break if @guesses >= 12

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

        if permutations.uniq.length == 1
          computer_win(@guesses)
          @guesses = 15
        end

        @guesses += 1
      end
    end
    computer_loss if @guesses == 12
  end
end

ComputerSolver.new([0,1, 0,9])
