def day_03(input_path, part = 1)
  if part == 1
    day_03_part_01(input_path)
  elsif part == 2
    day_03_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def day_03_part_01(input_path)
  input = File.read(input_path).split("\n")
  length =  input.first.length
  gamma_rate = []
  epsilon_rate = []

  (0..length-1).each do |bin|
    col = input.map { |n| n[bin].to_i }
    if col.count(1) > col.count(0) 
      gamma_rate << 1
      epsilon_rate << 0
    else
      gamma_rate << 0
      epsilon_rate << 1
    end
  end

  gamma_rate.join('').to_i(2) * epsilon_rate.join('').to_i(2)
end

def day_03_part_02(input_path)
  input = File.read(input_path).split("\n")
  gamma_rate = []
  epsilon_rate = []
  @length =  input.first.length
  index = 0
  oxygen_gen_checker(input, index).join('').to_i(2) * co2_scrubber(input, index).join('').to_i(2) 
end

def oxygen_gen_checker(input, index)
  return input if index == @length  || input.length == 1
  col = input.map { |n| n[index].to_i }
  if col.count(1) > col.count(0) || col.count(1) == col.count(0)
    list = input.select { |n| n[index] == '1'}
    oxygen_gen_checker(list, index + 1)
  else
    list = input.select { |n| n[index] == '0'}
    oxygen_gen_checker(list, index + 1)
  end
end

def co2_scrubber(input, index)
  return input if index == @length || input.length == 1
  col = input.map { |n| n[index].to_i }
  if col.count(1) > col.count(0) || col.count(1) == col.count(0)
    list = input.select { |n| n[index] == '0'}
    co2_scrubber(list, index + 1)
  else
    list = input.select { |n| n[index] == '1'}
    co2_scrubber(list, index + 1)
  end
end