class HumanSolver
  include InputValidation
  include TextMessages
  include SolvingLogic

  def initialize(code)
    @code = code
    @guesses = 0
    play
  end

  private

  def play
    until @guesses >= 12
      result = attempt
      return if result.nil? ? false : process(result)
    end
    loss_message if @guesses == 12
  end

  def attempt
    guess = player_guess
    valid_guess?(guess) ? results(guess) : guess_error
  end

  def player_guess
    guess_prompt
    gets.chomp.split('')
  end

  def process(result)
    if result[0] == 4
      win_message
      @guesses = 15
    else
      display_result(result)
      @guesses += 1
    end
    false
  end
end
