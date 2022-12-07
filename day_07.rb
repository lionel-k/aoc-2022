require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/7

# Solution of Day 07 of AOC 2022
class Day07
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
    # [{:/=>[{:a=>[{:e=>[584]}, 29116, 2557]}, {:d=>[4060174, 8033020]}, 14848514, 8504156]}, {"cd"=>"cd"}]
    @pt = -1
    @fs = []
  end

  def part1
    # parent_directory = nil
    # current_directory = nil

    # binding.pry
    input.each do |line|
      # binding.pry
      if line.start_with?("$")
        # binding.pry
        if line.scan(/cd/).first == "cd"
          change_directory = line.scan(/cd (.*)/).first.first
          if change_directory == ".."
            @pt -= 1
          else
            @pt += 1
          end
          binding.pry
          @fs[@pt] = { change_directory => [] } if @fs[@pt].nil?
        end
      end
    end
    @fs
  end

  def part2
  end
end

# - / (dir)
#   - a (dir)
#     - e (dir)
#       - i (file, size=584)
#     - f (file, size=29116)
#     - g (file, size=2557)
#     - h.lst (file, size=62596)
#   - b.txt (file, size=14848514)
#   - c.dat (file, size=8504156)
#   - d (dir)
#     - j (file, size=4060174)
#     - d.log (file, size=8033020)
#     - d.ext (file, size=5626152)
#     - k (file, size=7214296)

describe Day07 do
  describe ".part1" do
    it "computes the file system" do
      input = File.read("inputs/day_07_test_1.txt")
      # filesystem = [
      #   {
      #     "/" => [
      #       # { a: [{ e: [584] }, 29_116, 2557, 62_596] },
      #       # { a: [] }
      #       # 14_848_514,
      #       # 8_504_156,
      #       # { d: [4_060_174, 8_033_020, 5_626_152, 7_214_296] }
      #     ]
      #   }
      # ]
      filesystem = []
      expect(Day07.new(input).part1).to eq(filesystem)
    end

    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_07_test_1.txt")
      # expect(Day07.new(input).part1).to eq(95_437)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_07_test_2.txt")
      # expect(Day07.new(input).part1).to eq(nil)
    end
  end

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_07_test_1.txt")
      # expect(Day07.new(input).part2).to eq(nil)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_07_test_2.txt")
      # expect(Day07.new(input).part2).to eq(nil)
    end
  end
end
