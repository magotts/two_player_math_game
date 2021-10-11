require './player.rb'
require './question.rb'

class Game
  
# Ask for Player 1 and 2's name
  def initialize
    puts "What is Player 1's name?"
    player1 = gets.chomp
    @player1 = Player.new(player1)
    puts "Welcome player #{player1}"
    puts " -------------------------"
    puts "What is Player 2's name?"
    player2 = gets.chomp
    @player2 = Player.new(player2)
    puts "Welcome player #{player2}"
  end

  # Create a question with Question class
  def create_question
    @newQuestion = Question.new
    puts "---- NEW TURN ----"
      if @player1.turn
          puts "#{@player1.name}: #{@newQuestion.question}"
      else @player2.turn
          puts "#{@player2.name}: #{@newQuestion.question}"
       end
  end

  # Check if input answer is the same as @answer in Question class
  def validate_answer
    if gets.chomp.to_i == @newQuestion.answer
      if @player1.turn
        puts "Yes! You are correct, #{@player1.name}"
        player2_turn
        current_lives
        final_result
      else
        puts "Yes! You are correct #{@player2.name}."
        player1_turn
        current_lives
        final_result
      end
    elsif @player1.turn
      @player1.lives -= 1
      puts "Seriously #{@player1.name}? No!"
      player2_turn
      current_lives
      final_result
    else
      @player2.lives -= 1
      puts "Seriously #{@player2.name}? No, you are wrong."
      player1_turn
      current_lives
      final_result
    end
  end

  # Show the current lives
  def current_lives
    puts "Current Score: #{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def player1_turn
    @player1.turn = true
    @player2.turn = false
  end

  def player2_turn
    @player1.turn = false
    @player2.turn = true
  end

  # Check if we have a winner, if not, go back to "start"
  def final_result
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3"
      puts "----- GAME OVER -----"
      puts "Goodbye!"
    elsif @player2.lives == 0
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3"
      puts "----- GAME OVER -----"
      puts "Goodbye!"
    else start
    end
  end 

  def start
   create_question
   validate_answer
  end

end