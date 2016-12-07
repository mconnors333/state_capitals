# Import capitals file
require_relative 'capitals'

# Clear terminal window
system 'clear'

# set states to states from capitals file
states = Capitals.states

# VARIABLES
score = 0
questions_left = 50

# Shuffle States
shuffled_states = states.shuffle

# Introduction to game
puts "\n\n"
puts 'WELCOME TO STATE CAPITALS TRIVIA'
puts "\n\n\n"

# User chooses difficulty and gets number of hints
puts 'What difficult would you like to play? easy, medium, or hard'
difficulty = gets.chomp
difficulty.downcase!
if difficulty == 'easy'
  hints = 15
elsif difficulty == 'medium'
  hints = 10
elsif difficulty == 'hard'
  hints = 5
else
  puts "You didn't type what I asked so you only get 3!"
  hints = 3
end
puts "Having Trouble?  Type 'hint' for the first 3 letters of the answer"
puts "Caution. You only get #{hints} per game."
puts "\n\n\n\n\n"

# Iterate through each of the shuffled states
shuffled_states.each do |name|
  puts "What is the capital of #{name[:name]}?"
  user_answer = gets.chomp
  user_answer.downcase!
  answer = name[:capital]
  answer.downcase!

  # Check to see if the user has typed hint and checks if they have any left
  if user_answer == 'hint' && hints.zero?
    puts 'Sorry, you have no hints left. Try again.'
    new_answer = gets.chomp
    new_answer.downcase!

    # Check users new answer
    if new_answer == answer
      score += 1
      questions_left -= 1
      puts "Congrats! You were correct.  Your score is now #{score}.  There are #{questions_left} questions left."
    else
      questions_left -= 1
      puts "Sorry you were incorrect.  The correct answer was #{name[:capital].capitalize}. Your score is still #{score}.  There are #{questions_left} questions left."
    end

    # If user has typed hint and they have some left
  elsif user_answer == 'hint' && hints > 0
    hints -= 1
    puts name[:capital][0, 3].capitalize
    puts "#{hints} hints left. Try again!" if hints > 0
    new_answer = gets.chomp
    new_answer.downcase!

    # Check users new answer
    if new_answer == answer
      score += 1
      questions_left -= 1
      puts "Congrats! You were correct.  Your score is now #{score}.  There are #{questions_left} questions left."
    else
      questions_left -= 1
      puts "Sorry you were incorrect.  The correct answer was #{name[:capital].capitalize}. Your score is still #{score}.  There are #{questions_left} questions left."
    end

    # Check users answer
  elsif user_answer == answer
    score += 1
    questions_left -= 1
    puts "Congrats! You were correct.  Your score is now #{score}.  There are #{questions_left} questions left."
  else
    questions_left -= 1
    puts "Sorry you were incorrect.  The correct answer was #{name[:capital].capitalize}. Your score is still #{score}.  There are #{questions_left} questions left."
  end
end

puts "Congrats! You got a total of #{score} correct."
