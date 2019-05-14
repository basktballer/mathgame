require 'pry'
require './question'
require './player'

class Game
  def initialize
    @p1 = Player.new 'Player1'
    @p2 = Player.new 'Player2'
    @turn = 0
  end

  def start
    puts "New Math Game Started!!!"
    
    while @p1.lives > 0 && @p2.lives > 0
      puts "----- NEW TURN -----"
      if @turn == 0
        q = Question.new @p1.name
        puts "#{@p1.name}: What does #{q.var1} plus #{q.var2} equal?"
        ans = gets.chomp.to_i
        check = q.check_answer(ans)
        if check 
          puts "#{@p1.name}: Seriously? No!"
          @p1.loselife
        else 
          puts "#{@p1.name}: YES! You are correct."
        end
        @turn = 1
      else
        q = Question.new @p2.name
        puts "#{@p2.name}: What does #{q.var1} plus #{q.var2} equal?"
        ans = gets.chomp.to_i
        check = q.check_answer(ans)
        if check 
          puts "#{@p2.name}: Seriously? No!"
          @p2.loselife
        else 
          puts "#{@p2.name}: YES! You are correct."
        end
        @turn = 0
      end
      puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    end

    if @p1.lives == 0
      puts "#{@p2.name} wins with a score of #{@p2.lives}/3"
    else 
      puts "#{@p1.name} wins with a score of #{@p1.lives}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end

game = Game.new
game.start