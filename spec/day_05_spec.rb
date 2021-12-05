require "day-05-solution"

TEST_INPUT_05 = File.join("spec", "test_inputs", "day-05-test.txt")

describe "Day 05: Part 1" do
  it "should return the correct answer" do
    expect(day_05(input_path = TEST_INPUT_05, part = 1)).to eq 5
  end
end

describe "Day 05: Part 2" do
  it "should return the correct answer" do
    expect(day_05(input_path = TEST_INPUT_05, part = 2)).to eq 12
  end
end