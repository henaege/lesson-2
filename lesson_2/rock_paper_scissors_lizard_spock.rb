# rock_paper_scissors.rb

VALID_CHOICES = %w(rock paper scissors lizard spock)
# OTHER_VALID_CHOICES = %w(r p sc l sp)
COMBINED_VALID_CHOICES = %w(rock(r) paper(p) scissors(sc) lizard(l) spock(sp))

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

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("The Computer won this round!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{COMBINED_VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if choice.start_with?('r')
      choice = 'rock'
      break
    elsif choice.start_with?('p')
      choice = 'paper'
      break
    elsif choice.start_with?('sc')
      choice = 'scissors'
      break
    elsif choice.start_with?('l')
      choice = 'lizard'
      break
    elsif choice.start_with?('sp')
      choice = 'spock'
      break
    elsif VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; the computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  
  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()

  unless answer.downcase().start_with?('y')
    break
  end
end

prompt("Thank you for playing! Good Bye.")
