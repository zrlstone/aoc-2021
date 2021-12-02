input = File.read("day-02-input.txt").split("\n")

# part 1

position = {}

input.each do |line|
  direction = line.split(" ")
  if position[direction[0]]
    position[direction[0]] += direction[1].to_i 
  else
    position[direction[0]] = direction[1].to_i unless position[direction[0]]
  end
end

p (position['down'] - position['up']) * position['forward']

# part 2

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

p position['depth'] * position['foward']
