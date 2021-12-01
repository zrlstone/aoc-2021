input = File.read("day-01-input.txt")

# part 1

array = input.split("\n").map { |num| num.to_i }

def depth_finder(array)
  prev = array.first
  depth_increase = []
  array.each do |num|
    depth_increase << num if num > prev
    prev = num
  end
  depth_increase.count
end

p depth_finder(array)


# part 2

windows = array.map.with_index do |n, i|
  window = array[i..i+2]
  window.inject(:+)
end

p depth_finder(windows)