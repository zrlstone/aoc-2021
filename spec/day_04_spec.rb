require "day-04-solution"

TEST_INPUT_04 = File.join("spec", "test_inputs", "day-04-test.txt")

describe "Day 04: Part 1" do
  it "should return the correct answer" do
    expect(day_04(input_path = TEST_INPUT_04, part = 1)).to eq 4512
  end
end

describe "Day 04: Part 2" do
  it "should return the correct answer" do
    expect(day_04(input_path = TEST_INPUT_04, part = 2)).to eq 1924
  end
end