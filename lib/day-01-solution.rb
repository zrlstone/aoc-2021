def day_01(input_path, part = 1)
  if part == 1
    day_01_part_01(input_path)
  elsif part == 2
    day_01_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def day_01_part_01(input_path)
  input = File.read(input_path)
  array = input.split("\n").map { |num| num.to_i }
  depth_finder(array)
end

def depth_finder(array)
  prev = array.first
  depth_increase = []
  array.each do |num|
    depth_increase << num if num > prev
    prev = num
  end
  depth_increase.count
end


def day_01_part_02(input_path)
  input = File.read(input_path)
  array = input.split("\n").map { |num| num.to_i }
  windows = array.map.with_index do |n, i|
    window = array[i..i+2]
    window.inject(:+)
  end
  depth_finder(windows)
end