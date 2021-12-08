require "day-08-solution"

TEST_INPUT_08 = File.join("spec", "test_inputs", "day-08-test.txt")

describe "Day 08: Part 1" do
  it "should return the correct answer" do
    expect(day_08(input_path = TEST_INPUT_08, part = 1)).to eq 26
  end
end

describe "Day 08: Part 2" do
  it "should return the correct answer" do
    expect(day_08(input_path = TEST_INPUT_08, part = 2)).to eq 61229
  end
end