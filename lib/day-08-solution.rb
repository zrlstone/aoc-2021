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

def day_08_part_02(input_path)
  file = parse_file(input_path)

  correct_segments = {
    0 => "abcefg",
    1 => "cf",
    2 => "acdeg",
    3 => "acdfg",
    4 => "bcdf",
    5 => "abdfg",
    6 => "abdefg",
    7 => "acf",
    8 => "abcdefg",
    9 => "abcdfg"
  }

  codes = []
  file.each do |line|
    # Get all 10 inputs in 1 string
    example = line[0]
    tally_of_letters = example.gsub(/\s+/, '').split('').tally

    scrambled_signals = {
      0 => nil,
      1 => nil,
      2 => nil,
      3 => nil,
      4 => nil,
      5 => nil,
      6 => nil,
      7 => nil,
      8 => nil,
      9 => nil
    }

    example.split(' ').each do |code|
      if code.length == 2
        scrambled_signals[1] = code
      elsif code.length == 3
        scrambled_signals[7] = code
      elsif code.length == 4
        scrambled_signals[4] = code
      elsif code.length == 7
        scrambled_signals[8] = code
      end
    end

    segments = {
      a: nil,
      b: nil,
      c: nil,
      d: nil,
      e: nil,
      f: nil,
      g: nil
    }
    # a appears 8 times but is the difference between 7 and 1 which can be found out first

    segment_a = (scrambled_signals[7].split('') - scrambled_signals[1].split('')).first
    segments[:a] = segment_a
    
    # b appears 6 times

    segment_b = tally_of_letters.key(6)
    segments[:b] = segment_b
    # c appears 8 times

    segment_c = tally_of_letters.select{|k, v| k != segment_a && v == 8 }.first[0]
    segments[:c] = segment_c
    
    # e appears 4 times
    
    segment_e = tally_of_letters.key(4)
    segments[:e] = segment_e

    # f appears 9 times
    
    segment_f = tally_of_letters.key(9)
    segments[:f] = segment_f

    # d appears 7 times

    segment_d = scrambled_signals[4].split('').reject { |l| [segment_a, segment_b, segment_c, segment_e, segment_f].include?(l) }.first
    segments[:d] = segment_d

    # g appears 7 times

    letters = ('a'..'g').to_a
    segments.each { |k,v| letters = letters - [v] }
    segments[:g] = letters.first

    number_code = []
    line[1].split(' ').each do |e|
      code = e.split('').map { |l| segments.key(l)}
      number_code << correct_segments.key(code.sort.join)
    end
    codes << number_code.join.to_i
    
  end
  codes.sum

end