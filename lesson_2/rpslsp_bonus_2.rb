# rpslsp_bonus_2.rb

# based on rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORT_VALID_CHOICES = 'r = rock; p = paper; s = scissors; k = spock; l = lizard'

WINNING_COMBOS = {
  'rock' => %w(scissors lizard),
  'paper' => %w(rock spock),
  'scissors' => %w(paper lizard),
  'lizard' => %w(spock paper),
  'spock' => %w(scissors rock)
}

# def test_method
#  prompt('test message')
# end

# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def short_choice(letter)
  case letter
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 's' then 'scissors'
  when 'l' then 'lizard'
  when 'k' then 'spock'
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round! You scored 1 point.")
  elsif win?(computer, player)
    prompt("The Computer won this round! The Computer scored 1 point.")
  else
    prompt("It's a tie! No points were awarded this round.")
  end
end

loop do
  player_score = 0
  computer_score = 0

  prompt('')
  prompt("Let's play Rock, Paper, Scissors, Spock, Lizard!")
  prompt('')
  prompt("Scissors cuts Paper, Paper covers Rock, Rock crushes Lizard,")
  prompt("Lizard poisons Spock, Spock smashes Scissors, Scissors")
  prompt("decapitates Lizard, Lizard eats Paper, Paper disproves Spock,")
  prompt("Spock vaporizes Rock, and as it always has,")
  prompt("Rock crushes Scissors.")
  prompt('')

  loop do
    choice = ''
    loop do
      prompt("Choose one: #{SHORT_VALID_CHOICES}")
      choice = Kernel.gets().chomp()
      choice = short_choice(choice)
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice}; the computer chose: #{computer_choice}")

    if win?(choice, computer_choice)
      player_score += 1
    elsif win?(computer_choice, choice)
      computer_score += 1
    end

    display_results(choice, computer_choice)

    prompt("Current Score:")
    prompt("Player: #{player_score}")
    prompt("Computer: #{computer_score}")

    if player_score == 5
      prompt("You won the Game! Congratulations!")
      break
    elsif computer_score == 5
      prompt("The Computer won the Game! You're not very good at this are you?")
      break
    end
  end
  prompt("Want to play again? ('Y' to continue, any other letter to quit)")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end
prompt("Thank you for playing! Good Bye.")
