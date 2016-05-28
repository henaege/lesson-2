# loan_calculator.rb
=begin
  - Ask the user for:
    - Loan Amount
    - Anual Percentage Rate (APR)
    - Loan duration

  - From these, calculate:
    - monthly interest rate
    - loan duration in months

    Tell the user their monthly payment

=end

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome to Loan Calculator")
prompt("--------------------------")

loop do
  prompt("What is the loan amount?")

  amount = ''
  loop do
    amount = Kernel.gets().chomp()

    if amount.empty?() || amount.to_f() < 0
      prompt("Please enter a valid amount of money (think positive).")
    else
      break
    end
  end

  prompt("What is the estimated APR of the loan?")
  prompt("Example: 5 for 5% or 2.5 for 2.5%")
  apr = ''
  loop do
    apr = Kernel.gets().chomp()

    if apr.empty?() || apr.to_f() < 0
      prompt("Please enter a valid  (think positive)")
    else
      break
    end
  end

  prompt("Please enter the duration of the loan (in years):")
  duration = ''

  loop do
    duration = Kernel.gets().chomp()

    if duration.empty?() || duration.to_f() < 0
      prompt("Please enter a valid loan duration (in years - think positive)")
    else
      break
    end
  end

  prompt("Please enter your Down Payment:")
  down_payment = ''

  loop do
    down_payment = Kernel.gets().chomp()

    if down_payment.empty?() || down_payment.to_i() < 0
      prompt("Please enter a valid Down Payment amount (think positive)")
    else
      break
    end
  end

  annual_rate = apr.to_f() / 100
  monthly_rate = annual_rate / 12
  months = duration.to_i() * 12

  monthly_payment = (amount.to_i() - down_payment.to_i()) *
                    (monthly_rate /
                    (1 - (1 + monthly_rate)**-months.to_i()))

  prompt("Your monthly payment would be: $#{format('%02.2f', monthly_payment)}")

  prompt("Would you like to calculate another monthly payment?")
  answer = Kernel.gets().chomp()

  break unless answer.downcase().start_with?('y')
end

prompt("Thanks using the Loan Calculator! Tell your friends what a good time you had!")
prompt("See you next time!")
