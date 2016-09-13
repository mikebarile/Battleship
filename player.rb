class HumanPlayer

	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_play
		p "Enter your move now!"
		move = gets.chomp.split("")
		[move[0], move[3]]
	end

end
