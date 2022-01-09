# frozen_string_literal: true

# Methods that output text on the screen
module TextMessages
  def guess_error
    puts 'Please input a 4 digit number, containing only numeric characters!'
  end

  def guess_prompt
    puts 'Guess the code the computer chose! (It has 4 digits)'
  end

  def display_result(result)
    puts "You got #{result[0]} digits exactly right!"
    puts "You got #{result[1]} digits right, but in the wrong place."
  end

  def win_message
    puts 'You cracked the code! Congratulations!'
  end

  def loss_message
    puts 'You ran out of tries, better luck next time!'
  end

  def computer_loss
    puts "The computer was unable to beat the code within 12 attempts! \n Good Job!"
  end

  def computer_win(tries)
    puts "The computer cracked the code in #{tries} attempts!"
  end

  def request_input
    puts 'Please input a 4 digit numeric code, with numbers from 1 to 9'
  end

  def computer_guessed(guess, result)
    puts "The computer guessed #{guess}. It had #{result[0]} exactly right, and #{result[1]} were close."
  end
end
