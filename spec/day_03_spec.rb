require "day-03-solution"

TEST_INPUT_03 = File.join("spec", "test_inputs", "day-03-test.txt")

describe "Day 03: Part 1" do
  it "should return the correct answer" do
    expect(day_03(input_path = TEST_INPUT_03, part = 1)).to eq 198
  end
end

describe "Day 03: Part 2" do
  it "should return the correct answer" do
    expect(day_03(input_path = TEST_INPUT_03, part = 2)).to eq 230
  end
end