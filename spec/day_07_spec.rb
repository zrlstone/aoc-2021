require "day-07-solution"

TEST_INPUT_07 = File.join("spec", "test_inputs", "day-07-test.txt")

describe "Day 07: Part 1" do
  it "should return the correct answer" do
    expect(day_07(input_path = TEST_INPUT_07, part = 1)).to eq 37
  end
end

describe "Day 07: Part 2" do
  it "should return the correct answer" do
    expect(day_07(input_path = TEST_INPUT_07, part = 2)).to eq 168
  end
end