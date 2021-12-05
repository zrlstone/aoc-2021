require 'pp'
input = File.read("day-05-input.txt").lines

c_array = input.map { |line| line.split('->').map { |c| c.scan(/\d+/).map(&:to_i)} }


# Find the largest x and y value. Put each pair into an array
# [[8,0], [0,8], [0,9], [5,9]].transpose
# => [[8, 0, 0, 5], [0, 8, 9, 9]]

t_array = c_array.flatten(1).transpose

# Get max x value
# array.first.max => 8

x = t_array.first.max

# Get max y value
# array.last.max => 9

y = t_array.last.max


# Create a x by y grid as an array
# [
#   ['.', '.'],
#   ['.', '.']
# ]
# Array.new(y + 1) { Array.new(x + 1) { nil } }

grid = Array.new(y + 1) { Array.new(x + 1) { nil } }


# Load each coordinate pair into an array of arrays
# [[0,9], [5,9]]

c_array.each do |c_pair|
  p " ----------------------- "
  p "Pair of numbers: #{c_pair}"

  # Transpose the row to check for x1 x2 or y2 y2 matches
  # [[0,9], [5,9]].transpose.map { |pair| pair.uniq }.select { |pair| pair.length == 1 }.flatten
  # => [9]

  match = c_pair.transpose.map { |pair| pair.uniq }.select { |pair| pair.length == 1 }.flatten
  p "Is there a common number: #{match.any?}"

  # Get the index of match
  # [[0,9], [5,9]].first.index(9)
  # => 1
  # if 1
  # horizontal = true else = false

  # y_axis = [0, 9][1]
  # x_axis = [0 , 9][0]
  # static_number = 9

  if match.any?
    index = c_pair.first.index(match.first)
    horizontal = index == 1 
    y_axis = c_pair.first[1]
    x_axis = c_pair.first[0]
    static_number = match.first
    increasing_index = horizontal ? 0 : 1
    start = c_pair.first[increasing_index] < c_pair.last[increasing_index] ? c_pair.first[increasing_index] : c_pair.last[increasing_index]
    p "Starting Number: #{start}"
    ending = c_pair.last[increasing_index] < c_pair.first[increasing_index] ? c_pair.first[increasing_index] : c_pair.last[increasing_index]
    p "Ending Number: #{ending}"
    (start..ending).each do |n|
      if horizontal
        grid[static_number][n].nil? ? grid[static_number][n] = 1 : grid[static_number][n] += 1
        p "Grid at row #{static_number}: #{grid[static_number]}"
      else
        grid[n][static_number].nil? ? grid[n][static_number] = 1 : grid[n][static_number] += 1
        p "Grid at row #{n}: #{grid[n]}"
      end
    end

  else
    # [[1,1], [3,3]] => [1, 1], [2, 2], [3, 3]
    # [[8,0], [0,8]] => [8, 0], [7, 1], [6, 2] ... 
    # [[6,4], [2,0]] => [6, 4], [5, 3] .. 

    # if the first number is smaller than the second, increment

    increment_y = c_pair.first[1] < c_pair.last[1] ? 1 : -1
    increment_x = c_pair.first[0] < c_pair.last[0] ? 1 : -1

    c = c_pair.first

    while c_pair.first[0] != c_pair.last[0] 
      p "Currently in coordinate: #{grid[c[1]][c[0]]}"
      grid[c[1]][c[0]].nil? ? grid[c[1]][c[0]] = 1 : grid[c[1]][c[0]] += 1
      p "Now in coordinate: #{grid[c[1]][c[0]]}"
      p "Grid at row #{c[1]}: #{grid[c[1]]}"
      c[1] += increment_y
      c[0] += increment_x
      p "Next coordinates: #{[c[1], c[0]]}"
    end

    grid[c[1]][c[0]].nil? ? grid[c[1]][c[0]] = 1 : grid[c[1]][c[0]] += 1
    p "Grid at row #{c[1]}: #{grid[c[1]]}"

    # else reduce


  end
end
# Once the input has been looped through, count 
pp grid
p "Answer: #{grid.flatten.compact.count { |n|  n > 1 }}"

