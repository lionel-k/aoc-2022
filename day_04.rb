require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/4

# Solution of Day 04 of AOC 2022
class Day04
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def part1
    input
      .select do |line|
        range1, range2 = line.split(",")
        overlap(range1, range2) || overlap(range2, range1)
      end
      .count
  end

  def part2
  end

  private

  def overlap(range1, range2)
    range1_start, range1_end = range1.split("-")
    range2_start, range2_end = range2.split("-")

    (
      range1_start.to_i >= range2_start.to_i &&
        range1_end.to_i <= range2_end.to_i
    )
  end
end

describe Day04 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_04_test_1.txt")
      expect(Day04.new(input).part1).to eq(2)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_04_test_2.txt")
      expect(Day04.new(input).part1).to eq(534)
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_04_test_1.txt")
      expect(Day04.new(input).part2).to eq(4)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_04_test_2.txt")
      # expect(Day04.new(input).part2).to eq(nil)
    end
  end
end
