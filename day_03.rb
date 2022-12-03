require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/3

# Solution of Day 03 of AOC 2022
class Day03
  attr_reader :rucksacks

  PRIORITIES = ("a".."z").zip(1..26).to_h.merge(("A".."Z").zip(27..52).to_h)

  def initialize(input)
    @rucksacks = input.split("\n")
  end

  def part1
    rucksacks
      .map do |rucksack|
        size = rucksack.size
        first = rucksack[0..size / 2 - 1]
        second = rucksack[size / 2..]

        PRIORITIES[
          first
            .split("")
            .select do |char|
              first.count(char).positive? && second.count(char).positive?
            end[
            0
          ]
        ]
      end
      .compact
      .sum
  end

  def part2
  end
end

describe Day03 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_03_test_1.txt")
      expect(Day03.new(input).part1).to eq(157)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_03_test_2.txt")
      expect(Day03.new(input).part1).to eq(8233)
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_03_test_1.txt")
      expect(Day03.new(input).part2).to eq(nil)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_03_test_2.txt")
      # expect(Day03.new(input).part2).to eq(nil)
    end
  end
end
