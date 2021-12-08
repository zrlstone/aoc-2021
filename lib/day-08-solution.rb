def day_08(input_path, part = 1)
  if part == 1
    day_08_part_01(input_path)
  elsif part == 2
    day_08_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def parse_file(input_path)
  File.read(input_path).lines.map { |line| line.chomp.split(" | ")}
end

def day_08_part_01(input_path)
  file = parse_file(input_path)
  # count how many values are 2, 4, 3, 7 long
  accepted = [2, 4, 3, 7]
  count = 0
  file.each { |line| count += line[1].split(' ').select { |code| accepted.include?(code.length) }.length }
  count
end