# frozen_string_literal: true

# Methods checking if player input is allowed
module InputValidation
  def valid_guess?(guess)
    guess.length == 4
  end
end
