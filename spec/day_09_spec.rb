require "day-09-solution"

TEST_INPUT_09 = File.join("spec", "test_inputs", "day-09-test.txt")

describe "Day 09: Part 1" do
  it "should return the correct answer" do
    expect(day_09(input_path = TEST_INPUT_09, part = 1)).to eq 15
  end
end

describe "Day 09: Part 2" do
  it "should return the correct answer" do
    expect(day_09(input_path = TEST_INPUT_09, part = 2)).to eq 1134
  end
end