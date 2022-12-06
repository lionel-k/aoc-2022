require "pry"
require "rspec/autorun"
require "set"

# https://adventofcode.com/2022/day/6

# Solution of Day 06 of AOC 2022
class Day06
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def part1
    find_marker(size: 4)
  end

  def part2
    find_marker(size: 14)
  end

  private

  def find_marker(size: 4)
    index = 0
    result = nil
    while index < input.length - size && result.nil?
      marker = input[index..index + size - 1]
      result = marker if Set.new(marker.chars).length == size
      index += 1
    end
    index + size - 1
  end
end

describe Day06 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      expect(Day06.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").part1).to eq(7)
      expect(Day06.new("bvwbjplbgvbhsrlpgdmjqwftvncz").part1).to eq(5)
      expect(Day06.new("nppdvjthqldpwncqszvftbrmjlhg").part1).to eq(6)
      expect(Day06.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").part1).to eq(10)
      expect(Day06.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").part1).to eq(11)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_06_test_2.txt").chop
      expect(Day06.new(input).part1).to eq(1598)
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      expect(Day06.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").part2).to eq(19)
      expect(Day06.new("bvwbjplbgvbhsrlpgdmjqwftvncz").part2).to eq(23)
      expect(Day06.new("nppdvjthqldpwncqszvftbrmjlhg").part2).to eq(23)
      expect(Day06.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").part2).to eq(29)
      expect(Day06.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").part2).to eq(26)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_06_test_2.txt").chop
      expect(Day06.new(input).part2).to eq(2414)
    end
  end
end
