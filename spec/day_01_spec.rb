require "day-01-solution"

TEST_INPUT_01 = File.join("spec", "test_inputs", "day-01-test.txt")

describe "Day 01: Part 1" do
  it "should return the correct answer" do
    expect(day_01(input_path = TEST_INPUT_01, part = 1)).to eq 7
  end
end

describe "Day 01: Part 2" do
  it "should return the correct answer" do
    expect(day_01(input_path = TEST_INPUT_01, part = 2)).to eq 5
  end
end