input = File.read("day-03-input.txt").split("\n")

# part 1 

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

p gamma_rate.join('').to_i(2) * epsilon_rate.join('').to_i(2)

# part 2

gamma_rate = []
epsilon_rate = []
@length =  input.first.length

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



index = 0
p oxygen_gen_checker(input, index).join('').to_i(2) * co2_scrubber(input, index).join('').to_i(2) 


# For example, to determine the oxygen generator rating value using the same example diagnostic report from above:

# Start with all 12 numbers and consider only the first bit of each number. There are more 1 bits (7) than 0 bits (5), so keep only the 7 numbers with a 1 in the first position: 11110, 10110, 10111, 10101, 11100, 10000, and 11001.
# Then, consider the second bit of the 7 remaining numbers: there are more 0 bits (4) than 1 bits (3), so keep only the 4 numbers with a 0 in the second position: 10110, 10111, 10101, and 10000.
# In the third position, three of the four numbers have a 1, so keep those three: 10110, 10111, and 10101.
# In the fourth position, two of the three numbers have a 1, so keep those two: 10110 and 10111.
# In the fifth position, there are an equal number of 0 bits and 1 bits (one each). So, to find the oxygen generator rating, keep the number with a 1 in that position: 10111.
# As there is only one number left, stop; the oxygen generator rating is 10111, or 23 in decimal.
# Then, to determine the CO2 scrubber rating value from the same example above:

# Start again with all 12 numbers and consider only the first bit of each number. There are fewer 0 bits (5) than 1 bits (7), so keep only the 5 numbers with a 0 in the first position: 00100, 01111, 00111, 00010, and 01010.
# Then, consider the second bit of the 5 remaining numbers: there are fewer 1 bits (2) than 0 bits (3), so keep only the 2 numbers with a 1 in the second position: 01111 and 01010.
# In the third position, there are an equal number of 0 bits and 1 bits (one each). So, to find the CO2 scrubber rating, keep the number with a 0 in that position: 01010.
# As there is only one number left, stop; the CO2 scrubber rating is 01010, or 10 in decimal.
# Finally, to find the life support rating, multiply the oxygen generator rating (23) by the CO2 scrubber rating (10) to get 230.

