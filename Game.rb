require "./Player.rb"
require "./Board.rb"

class Game
	include Enumerable

  @@wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],
			[2,5,8],[0,4,8],[2,4,6]]
	@@SHAPES = ["X","O"]		
  def initialize
  	puts "First player,please enter your name"
    name1 = gets.chomp
    @player1 = Player.new(name1,'X')
    puts "First player,please enter your name"
    name2 = gets.chomp
    @player2 = Player.new(name2,'O')
    @board = [" "]*9
    @current_player = @player1
    
  end
  

  
  def play
 	#puts @board.methods
 	moves = 1 # counter to check the moves until 10
 	
 	while moves <10
 		
 	  move(@current_player)
 	  #@board.display
 	  agon(@board)
 	  #displayn(@board)
 	  if gamewin(@current_player)
 	    puts "#{@current_player.name} has won"
 	    break
 	  elsif tie?
 		puts "It's tie"
 		break
 	  else
 	    switch_player
 	  end

 	moves +=1
 	end
 	
  end

  
  def agon(board)
  	puts"\n\n"
  	board.each_slice(3) { |row| puts row.join("|")}
  	puts"\n\n"
  end
  
  

  def input_user
  	
  	valid = true

  	while valid == true do

  	  puts "Please enter a number between 1-9"
  	  input = gets.chomp
  	  input = input.to_i
  	  input = input -1
  	  
  	
  	  if valid_length?(input) && valid_pos?(input)
  	  	valid = false
  	    return input	
  	  else
  	  	puts "Please enter new number, your entered filled position or out of range number"
  	  	valid = true
  	  end
  	  break if valid == false
  	end
  	
  end


  def move(player)
  	pos = input_user
  	@board[pos] = player.mark
  	
  end

  def gamewin(player)
  	@@wins.any? do |item|
  	  item.all? {|pos| @board[pos] == player.mark}
  	end

  end
  
  def tie?
  	if @board.include?(" ")
  	  return false
  	else
  	  return true
  	end	
  end

  def valid_length?(input)
  	if input >=0 && input  <= 8
  		return true
  	end

  end

  def valid_pos?(input)
  	if @board[input] == (" ")
  		return true
  	end

  end

   def switch_player
  	if @current_player == @player1
  	  puts "Its players 2 turn"
  	  @current_player = @player2
  	else
  	  puts "Its player 1 turn"
  	  @current_player = @player1
  	end
  end

end

tictactoe = Game.new
tictactoe.play

