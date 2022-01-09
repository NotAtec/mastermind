# frozen_string_literal: true

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

      close += 1 if guess.include?(digit.to_s) || guess.include?(digit)
    end
    close
  end
end
