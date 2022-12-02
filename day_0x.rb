require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/X

# Solution of Day 0X of AOC 2022
class Day0X
  def initialize(input)
  end

  def part1
  end

  def part2
  end
end

describe Day0X do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_01_test_1.txt")
      expect(Day01.new(input).part1).to eq(nil)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_01_test_2.txt")
      expect(Day01.new(input).part1).to eq(nil)
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_01_test_1.txt")
      expect(Day01.new(input).part2).to eq(nil)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_01_test_2.txt")
      expect(Day01.new(input).part2).to eq(nil)
    end
  end
end
