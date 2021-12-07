def day_07(input_path, part = 1)
  if part == 1
    day_07_part_01(input_path)
  elsif part == 2
    day_07_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def parse_file(input_path)
  File.read(input_path).split(',').map(&:to_i)
end

def day_07_part_01(input_path)
  input = parse_file(input_path)
  sorted_input = input.sort
  median = (sorted_input.length + 1) / 2
  calculate_fuel_usage(sorted_input[median], input)
end

def calculate_fuel_usage(value, input)
  fuel = 0
  input.each do |v|
    fuel += (value - v).abs
  end
  fuel
end

def day_07_part_02(input_path)
  input = parse_file(input_path)
  sorted_input = input.sort
  median = (sorted_input.length + 1) / 2
  increment = sorted_input[0..median].sum < sorted_input[median..-1].sum ? 1 : -1 

  guess = sorted_input[median]
  smallest_fuel_usage = calculate_higher_fuel_usage(guess, input)

  loop do
    current = calculate_higher_fuel_usage(guess, input)
    guess += increment
    break if current > smallest_fuel_usage
    smallest_fuel_usage = current
  end
  smallest_fuel_usage
  
end

def calculate_higher_fuel_usage(value, input)
  fuel = 0
  step = 1
  input.each do |v|
    steps = (value - v).abs
    fuel += (steps * (steps + 1)) / 2
  end
  fuel
end