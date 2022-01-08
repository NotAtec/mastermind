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
end