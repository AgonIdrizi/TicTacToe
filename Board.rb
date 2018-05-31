

class Board
	include Enumerable

	attr_accessor :grid
  def initialize
   @grid = [" 1"]*9
  		
  end
  

  def each(&block)
    self.each {|member| block.call(member)}
  end

  


  def displayn(board)
  	puts"\n\n"
  	board.each_slice(3) { |row| puts row.join(" | ")}
  	puts"\n\n"
  end


  def move

  end


end

c = Board.new
c.display
