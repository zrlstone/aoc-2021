def day_02(input_path, part = 1)
  if part == 1
    day_02_part_01(input_path)
  elsif part == 2
    day_02_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def day_02_part_01(input_path)
  input = File.read(input_path).split("\n")
  position = {}
  input.each do |line|
    direction = line.split(" ")
    if position[direction[0]]
      position[direction[0]] += direction[1].to_i 
    else
      position[direction[0]] = direction[1].to_i unless position[direction[0]]
    end
  end
  (position['down'] - position['up']) * position['forward']
end

def day_02_part_02(input_path)
  input = File.read(input_path).split("\n")
  position = Hash.new(0)

  input.each do |line|
    direction = line.split(" ")
    if direction[0] == 'up'
      position['aim'] -= direction[1].to_i
    elsif direction[0] == 'down'
      position['aim'] += direction[1].to_i
    elsif direction[0] == 'forward'
      position['foward'] += direction[1].to_i
      position['depth'] += position['aim'] * direction[1].to_i
    end
  end
  position['depth'] * position['foward']
end