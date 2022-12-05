require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/5

# Solution of Day 05 of AOC 2022
class Day05
  attr_reader :input

  #     [D]
  # [N] [C]
  # [Z] [M] [P]
  #  1   2   3
  # CRATES = { 1 => %w[Z N], 2 => %w[M C D], 3 => %w[P] }.freeze

  # [M] [H]         [N]
  # [S] [W]         [F]     [W] [V]
  # [J] [J]         [B]     [S] [B] [F]
  # [L] [F] [G]     [C]     [L] [N] [N]
  # [V] [Z] [D]     [P] [W] [G] [F] [Z]
  # [F] [D] [C] [S] [W] [M] [N] [H] [H]
  # [N] [N] [R] [B] [Z] [R] [T] [T] [M]
  # [R] [P] [W] [N] [M] [P] [R] [Q] [L]
  #  1   2   3   4   5   6   7   8   9

  # [M] [H]         [N]
  # [S] [W]         [F]     [W] [V]
  # [J] [J]         [B]     [S] [B] [F]
  # [L] [F] [G]     [C]     [L] [N] [N]
  # [V] [Z] [D]     [P] [W] [G] [F] [Z]
  # [F] [D] [C] [S] [W] [M] [N] [H] [H]
  # [N] [N] [R] [B] [Z] [R] [T] [T] [M]
  # [R] [P] [W] [N] [M] [P] [R] [Q] [L]
  #  1   2   3   4   5   6   7   8   9

  CRATES = {
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

  def initialize(input)
    @input = input.split("\n")
  end

  def part1
    input.each do |instruction|
      quantity, from, destination =
        instruction.scan(/move (\d+) from (\d+) to (\d+)/).flatten.map(&:to_i)
      quantity.times do
        item = CRATES[from].pop
        CRATES[destination].push(item)
      end
    end
    CRATES.values.map(&:last).join("")
  end

  def part2
  end
end

describe Day05 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_05_test_1.txt")
      # expect(Day05.new(input).part1).to eq("CMZ")
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_05_test_2.txt")
      expect(Day05.new(input).part1).to eq("QPJPLMNNR")
      # expect(Day05.new(input).part1).to eq("QPJPLMNNR")
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_05_test_1.txt")
      # expect(Day05.new(input).part2).to eq(nil)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_05_test_2.txt")
      # expect(Day05.new(input).part2).to eq(nil)
    end
  end
end
