class Board

	attr_reader :grid


	def initialize(grid = Board.default_grid)
		@grid = grid
	end

	def count
		count = 0
		@grid.each do |arr|
			arr.each do |elem|
				count += 1 if elem == :s
			end
		end
		count
	end

	def empty?(pos = [100, 100])
		if pos == [100, 100]
			return true if count == 0
			return false if count > 0
		end

		if self[pos[0], pos[1]] == nil
			true
		else
			false
		end
	end

	def full?
		total_grid = @grid.inject(0){ |sum, arr| sum + arr.length}
		count_ships = @grid.inject(0) do |sum, arr|
			sum + arr.inject(0) do |arr_sum, elem| 
				if elem == :s
					arr_sum + 1 
				else
					arr_sum
				end
			end
		end

		return true if total_grid == count_ships
		false
	end

	def place_random_ship
		raise 'Error: grid is full' if full?
		placement = find_spots(@grid, nil).shuffle[0]
		self[placement[0], placement[1]] = :s
	end

	def won?
		return true if find_spots(@grid, :s).length == 0
		false
	end

	def find_spots(grid, mark)
		empty_locations = []
		grid.each_with_index do |arr, arr_index|
			arr.each_with_index do |elem, elem_index|
				empty_locations << [arr_index, elem_index] if elem == mark
			end
		end
		empty_locations
	end

	def [](*args)
		if args.length == 2
			@grid[args[0]][args[1]]
		else
			@grid[args[0][0]][args[0][1]]
		end
	end

	def []=(*args)
		if args.length == 3
			@grid[args[0]][args[1]] = args[2]
		else
			@grid[args[0][0]][args[0][1]] = args[1]
		end
	end

	def self.default_grid
		empty_grid = []
		10.times{empty_grid << []}
		empty_grid.each{ |arr| 10.times{ arr << nil } }
	end


end
