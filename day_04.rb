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
        range1_start, range1_end, range2_start, range2_end =
          line.split(",").map { |range| range.split("-").map(&:to_i) }.flatten
        full_overlap(range1_start, range1_end, range2_start, range2_end) ||
          full_overlap(range2_start, range2_end, range1_start, range1_end)
      end
      .count
  end

  def part2
    input
      .select do |line|
        range1_start, range1_end, range2_start, range2_end =
          line.split(",").map { |range| range.split("-").map(&:to_i) }.flatten
        partial_overlap(range1_start, range1_end, range2_start, range2_end) ||
          partial_overlap(range2_start, range2_end, range1_start, range1_end)
      end
      .count
  end

  private

  # def split_range(range)

  def full_overlap(range1_start, range1_end, range2_start, range2_end)
    (range1_start >= range2_start && range1_end <= range2_end)
  end

  def partial_overlap(range1_start, range1_end, range2_start, range2_end)
    range1_start <= range2_start && range2_start <= range1_end || # range2_start is in range1
      range1_start <= range2_end && range2_end <= range1_end # range2_end is in range1
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
      expect(Day04.new(input).part2).to eq(841)
    end
  end
end
