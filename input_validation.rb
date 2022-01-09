# frozen_string_literal: true

# Methods checking if player input is allowed
module InputValidation
  def valid_guess?(guess)
    guess.length == 4
  end

  def valid_code?(input)
    true if input.length == 4 && input.none?(0)
  end
end
