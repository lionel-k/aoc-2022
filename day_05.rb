require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/5

CRATE_1 = { 1 => %w[Z N], 2 => %w[M C D], 3 => %w[P] }.freeze

CRATE_2 = {
  1 => %w[R N F V L J S M],
  2 => %w[P N D Z F J W H],
  3 => %w[W R C D G],
  4 => %w[N B S],
  5 => %w[M Z W P C B F N],
  6 => %w[P R M W],
  7 => %w[R T N G L S W],
  8 => %w[Q T H F N B V],
  9 => %w[L M H Z N F]
}.freeze

# Solution of Day 05 of AOC 2022
class Day05
  attr_reader :input, :crate

  def initialize(input, crate)
    @input = input.split("\n")
    @crate = crate
  end

  def part1
    input.each do |instruction|
      quantity, from, destination =
        instruction.scan(/move (\d+) from (\d+) to (\d+)/).flatten.map(&:to_i)
      quantity.times { crate[destination].push(crate[from].pop) }
    end
    crate.values.map(&:last).join("")
  end

  def part2
    input.each do |instruction|
      quantity, from, destination =
        instruction.scan(/move (\d+) from (\d+) to (\d+)/).flatten.map(&:to_i)
      stack = crate[from].pop(quantity)
      crate[destination].push(*stack)
    end
    crate.values.map(&:last).join("")
  end
end

describe Day05 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_05_test_1.txt")
      crate1 = { 1 => %w[Z N], 2 => %w[M C D], 3 => %w[P] }
      expect(Day05.new(input, crate1).part1).to eq("CMZ")
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_05_test_2.txt")
      crate2 = {
        1 => %w[R N F V L J S M],
        2 => %w[P N D Z F J W H],
        3 => %w[W R C D G],
        4 => %w[N B S],
        5 => %w[M Z W P C B F N],
        6 => %w[P R M W],
        7 => %w[R T N G L S W],
        8 => %w[Q T H F N B V],
        9 => %w[L M H Z N F]
      }
      expect(Day05.new(input, crate2).part1).to eq("QPJPLMNNR")
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_05_test_1.txt")
      crate1 = { 1 => %w[Z N], 2 => %w[M C D], 3 => %w[P] }
      expect(Day05.new(input, crate1).part2).to eq("MCD")
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_05_test_2.txt")
      crate2 = {
        1 => %w[R N F V L J S M],
        2 => %w[P N D Z F J W H],
        3 => %w[W R C D G],
        4 => %w[N B S],
        5 => %w[M Z W P C B F N],
        6 => %w[P R M W],
        7 => %w[R T N G L S W],
        8 => %w[Q T H F N B V],
        9 => %w[L M H Z N F]
      }
      expect(Day05.new(input, crate2).part2).to eq("BQDNWJPVJ")
    end
  end
end
