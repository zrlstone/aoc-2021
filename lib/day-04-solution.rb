def day_04(input_path, part = 1)
  if part == 1
    day_04_part_01(input_path)
  elsif part == 2
    day_04_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def day_04_part_01(input_path)
  input = File.read(input_path).lines
  drawn_numbers_array =  input.first.split(",").map(&:to_i)
  input.slice!(0)
  bingo_grids = []
  grid_index = 0
  input.each do |line| 
    if line == "\n"
      bingo_grids.push(Array.new)
      grid_index += 1
    else
      bingo_grids[grid_index - 1] << line.split(" ").map(&:to_i)
    end
  end 
  drawn_numbers_array
  # [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]
  bingo_grids
  # [
  #   [
  #     [22, 13, 17, 11, 0],
  #     [8, 2, 23, 4, 24],
  #     [21, 9, 14, 16, 7],
  #     [6, 10, 3, 18, 5],
  #     [1, 12, 20, 15, 19]
  #   ],
  #   [
  #     [3, 15, 0, 2, 22],
  #     [9, 18, 13, 17, 5],
  #     [19, 8, 7, 25, 23],
  #     [20, 11, 10, 24, 4],
  #     [14, 21, 16, 12, 6]
  #   ],
  #   [
  #     [14, 21, 17, 24, 4],
  #     [10, 16, 15, 9, 19],
  #     [18, 8, 23, 26, 20],
  #     [22, 11, 13, 6, 5],
  #     [2, 0, 12, 3, 7]
  #   ]
  # ]
  answer = find_bingo_answer(bingo_grids, drawn_numbers_array)
end

def check_if_match(bingo_matrix, drawn_number)
  position = []
  bingo_matrix.each_with_index do |line, line_index|
    number_index = line.find_index(drawn_number)
    position = [line_index, number_index] if number_index
  end
  return position
end


def find_bingo_answer(bingo_grids, drawn_numbers_array)
  coordinates_array = Array.new(bingo_grids.count) { Array.new() }
  drawn_numbers_array.each do |drawn_number|
    bingo_grids.each_with_index do |grid, grid_index| 
      position = check_if_match(grid, drawn_number)
      if position.any?
        coordinates_array[grid_index] << position 
        t = coordinates_array[grid_index].transpose
        if t[0].tally.key(5) || t[1].tally.key(5)
          sum = 0
          grid.each_with_index do |line, line_index|
            line.each_with_index do |number, number_index|      
              unless coordinates_array[grid_index].include?([line_index, number_index])
                sum += number
              end
            end
          end
          return sum * drawn_number
        end
      end
    end
  end
end

def day_04_part_02(input_path)
  input = File.read(input_path).lines
  drawn_numbers_array =  input.first.split(",").map(&:to_i)
  input.slice!(0)
  bingo_grids = []
  grid_index = 0
  input.each do |line| 
    if line == "\n"
      bingo_grids.push(Array.new)
      grid_index += 1
    else
      bingo_grids[grid_index - 1] << line.split(" ").map(&:to_i)
    end
  end 
  drawn_numbers_array
  # [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13, 6, 15, 25, 12, 22, 18, 20, 8, 19, 3, 26, 1]
  bingo_grids
  find_last_winning_grid_answer(bingo_grids, drawn_numbers_array)
end



# part 2

def find_last_winning_grid_answer(bingo_grids, drawn_numbers_array)
  coordinates_array = Array.new(bingo_grids.count) { Array.new() }
  sum = 0
  last_drawn_number = 0
  last_winning_grid = []
  last_winning_grid_index = nil
  winners = []
  drawn_numbers_array.each do |drawn_number|
    bingo_grids.each_with_index do |grid, grid_index| 
      next if winners.include?(grid_index)
      position = check_if_match(grid, drawn_number)
      if position.any?
        coordinates_array[grid_index] << position 
        t = coordinates_array[grid_index].transpose
        if t[0].tally.key(5) || t[1].tally.key(5)
          last_winning_grid = grid
          last_winning_grid_index = grid_index
          last_drawn_number = drawn_number
          winners << grid_index
        end
      end
    end
  end

  sum = 0
  bingo_grids[last_winning_grid_index].each_with_index do |line, line_index|
    line.each_with_index do |number, number_index|      
      unless coordinates_array[last_winning_grid_index].include?([line_index, number_index])
        sum += number
      end
    end
  end
  return sum * last_drawn_number
end

