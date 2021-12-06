def day_06(input_path, part = 1)
  if part == 1
    day_06_part_01(input_path)
  elsif part == 2
    day_06_part_02(input_path)
  else
    raise ArgumentError.new "Part must be 1 or 2"
  end
end

def parse_file(input_path)
  File.read(input_path).split(',').map(&:to_i)
end

def day_06_part_01(input_path)
  initial_state = parse_file(input_path)
  tally_of_age = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  initial_state.tally.each { |k, v| tally_of_age[k] = v }
  # [0, 1, 1, 2, 1, 0, 0, 0, 0]
  # The tally will shift <-- left each passing day
  80.times do
    # All the day 0s become day 6s
    day_0_tally = tally_of_age[0]
    tally_of_age[7] += day_0_tally
    # Day 0 number of day 8s are spawned
    tally_of_age[9] += day_0_tally
    # Shifted into the right index
    tally_of_age.shift
    tally_of_age << 0
  end
  tally_of_age.sum
end

def day_06_part_02(input_path)
  initial_state = parse_file(input_path)
  tally_of_age = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  initial_state.tally.each { |k, v| tally_of_age[k] = v }
  # [0, 1, 1, 2, 1, 0, 0, 0, 0]
  # The tally will shift <-- left each passing day
  256.times do
    # All the day 0s become day 6s
    day_0_tally = tally_of_age[0]
    tally_of_age[7] += day_0_tally
    # Day 0 number of day 8s are spawned
    tally_of_age[9] += day_0_tally
    # Shifted into the right index
    tally_of_age.shift
    tally_of_age << 0
  end
  tally_of_age.sum
end
