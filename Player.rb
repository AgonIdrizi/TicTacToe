

class Player
	attr_accessor :name , :mark
  def initialize(name, mark)
  	@name = name
  	@mark = mark
  end


 

  def print_name
  	puts "#{@name} : #{@mark}"
  end
end