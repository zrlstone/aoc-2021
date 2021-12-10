def day_09(input_path, part = 1)
  if part == 1
    day_09_part_01(input_path)
  elsif part == 2
    day_09_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def parse_file(input_path)
  File.read(input_path).lines.map { |line| line.chomp.split('').map(&:to_i) }
end

def day_09_part_01(input_path)
  matrix = parse_file(input_path)
  # 2d array
  # [
  # [2, 1, 9, 9, 9, 4, 3, 2, 1, 0]
  # [3, 9, 8, 7, 8, 9, 4, 9, 2, 1]
  # [9, 8, 5, 6, 7, 8, 9, 8, 9, 2]
  # [8, 7, 6, 7, 8, 9, 6, 7, 8, 9]
  # [9, 8, 9, 9, 9, 6, 5, 6, 7, 8]
  # ]
  low_points = []
  matrix.each_with_index do |row, row_index|
    row.each_with_index do |num, col_index|
      surrounding_nums = []

      # top
      if (row_index - 1) >= 0
        surrounding_nums << matrix[row_index - 1][col_index]
      end

      # right
      if row.length > col_index + 1
        surrounding_nums << matrix[row_index][col_index + 1]
      end

      # bottom
      if (row_index + 1) < matrix.length
        surrounding_nums << matrix[row_index + 1][col_index]
      end

      # left
      if (col_index - 1) >= 0
        surrounding_nums << matrix[row_index][col_index - 1]
      end

      if surrounding_nums.select { |n| n <= num}.empty?
        low_points << num  + 1
      end
    end
  end
  low_points.sum
end


def day_09_part_02(input_path)
  matrix = parse_file(input_path)
p low_points_and_coordinates = find_low_points_and_coordinates(matrix)
  # [[1, 0, 1], [0, 0, 9], [5, 2, 2], [5, 4, 6]]
  # BFS
  n = low_points_and_coordinates.map { |x,y|
    node_stack = [[x,y]]
    used = [] 
    basin = []
    while node_stack.size > 0
      node_stack.each do |xx,yy|
        used << [xx,yy]
        invalid_x_axis = xx < 0 || xx >= matrix[0].size
        invalid_y_axis = yy < 0 || yy >= matrix.size 
        next if invalid_x_axis || invalid_y_axis || matrix[yy][xx] == 9
        basin << [xx,yy]
        node_stack += [ [xx,yy-1], [xx,yy+1], [xx-1,yy], [xx+1,yy] ]
      end
      node_stack = node_stack.uniq - used
    end
    basin
  }

  n = n.map {|b| b.size }.sort[-3..]
  answer = n[0] * n[1] * n[2]
end

def calculate_basin(y, x, matrix)
  node_stack = [[y, x]]
  used=[]

  loop do
    current_node = node_stack.pop
    y = current_node[0]
    x = current_node[1]
    current_num = matrix[y][x]
    

    if (y - 1) >= 0
      top_num = matrix[y - 1][x]
      not_used = !used.include?([y - 1, x])
      top_cons = top_num == current_num + 1
      if not_used && top_num != 9 && top_cons
        node_stack << [y - 1, x]
        used << [y - 1, x]
      end
    end

    if matrix[0].length >= (x + 1)
      right_num = matrix[y][x + 1]
      not_used = !used.include?([y, x + 1])
      right_cons = right_num == current_num + 1
      if not_used && right_num != 9 && right_cons
        node_stack << [y, x + 1]
        used << [y, x + 1]
      end
    end

    if matrix.length > (y + 1)
      bottom_num = matrix[y + 1][x]
      not_used = !used.include?([y + 1, x])
      bottom_cons = bottom_num == current_num + 1
      if not_used && bottom_num != 9 && bottom_cons
        node_stack << [y + 1, x]
        used << [y + 1, x]
      end
    end

    if (x - 1) >= 0
      left_num = matrix[y][x - 1]
      not_used = !used.include?([y, x - 1])
      left_cons = left_num == current_num + 1
      if not_used && left_num != 9 && left_cons
        node_stack << [y, x - 1]
        used << [y, x - 1]
      end
    end

    return used.length + 1 if node_stack.empty?

  end
  

end

def find_low_points_and_coordinates(matrix)

list = []
  matrix.each_with_index do |row, row_index|
    row.each_with_index do |num, col_index|
      surrounding_nums = []

      # top
      if (row_index - 1) >= 0
        surrounding_nums << matrix[row_index - 1][col_index]
      end

      # right
      if row.length > col_index + 1
        surrounding_nums << matrix[row_index][col_index + 1]
      end

      # bottom
      if (row_index + 1) < matrix.length
        surrounding_nums << matrix[row_index + 1][col_index]
      end

      # left
      if (col_index - 1) >= 0
        surrounding_nums << matrix[row_index][col_index - 1]
      end
      low_points = []
      if surrounding_nums.select { |n| n <= num}.empty?
        low_points << col_index
        low_points << row_index
        list << low_points
      end
      low_points
    end
  end
  list
end