require "day-06-solution"

TEST_INPUT_06 = File.join("spec", "test_inputs", "day-06-test.txt")

describe "Day 06: Part 1" do
  it "should return the correct answer" do
    expect(day_06(input_path = TEST_INPUT_06, part = 1)).to eq 5934
  end
end

describe "Day 06: Part 2" do
  it "should return the correct answer" do
    expect(day_06(input_path = TEST_INPUT_06, part = 2)).to eq 26984457539
  end
end