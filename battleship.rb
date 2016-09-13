class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
  	@board = board
  	@player = player
  end

  def attack(pos)
  	@board[pos] = :x
  end

  def count
  	@board.count
  end

  def game_over?
  	@board.won?
  end	

  def play_turn
  	pos = [-1, -1]
  	while valid_move?(pos) == false
		pos = @player.get_play
		p "Invalid move, try again!" unless valid_move?(pos)
  	end
  	attack(pos)
  end

  def valid_move?(pos)
  	end_of_grid = *(0 .. @board.grid.length - 1)

  	if end_of_grid.include?(pos[0]) && end_of_grid.include?(pos[1])
  		true
  	else
  		false
  	end
  end

end
