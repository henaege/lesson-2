# rpslsp_bonus.rb

# based on rock_paper_scissors.rb


VALID_CHOICES = %w(rock paper scissors lizard spock)
SHORT_VALID_CHOICES = ('r = rock p = paper s = scissors l = lizard k = spock')

# def test_method
#  prompt('test message')
# end

# test_method

def prompt(message)
  Kernel.puts("=> #{message}")
end

# test_method

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'spock' && second == 'scissors') ||
    (first == 'spock' && second == 'rock')
end

def short_choice(first)
  if first == 'r'
    choice = 'rock'
  elsif first == 'p'
    choice = 'paper'
  elsif first == 's'
    choice = 'scissors'
  elsif first == 'l'
    choice = 'lizard'
  elsif first == 'k'
    choice = 'spock'
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
  prompt("Do you want to play again? ('Y' to continue, any other letter to quit)")
  answer = Kernel.gets().chomp()

  unless answer.downcase().start_with?('y')
    break
  end
end
prompt("Thank you for playing! Good Bye.")
