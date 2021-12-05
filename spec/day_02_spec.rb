require "day-02-solution"

TEST_INPUT_02 = File.join("spec", "test_inputs", "day-02-test.txt")

describe "Day 02: Part 1" do
  it "should return the correct answer" do
    expect(day_02(input_path = TEST_INPUT_02, part = 1)).to eq 150
  end
end

describe "Day 02: Part 2" do
  it "should return the correct answer" do
    expect(day_02(input_path = TEST_INPUT_02, part = 2)).to eq 900
  end
end