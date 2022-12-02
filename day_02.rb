require "pry"
require "rspec/autorun"

# This class design a round of a Rock, Paper, Scissors game.
class Round
  attr_reader :player1, :player2, :input

  # SHAPE_PLAYER1 = { "X" => "Rock", "Y" => "Paper", "Z" => "Scissors" }.freeze
  # SHAPE_PLAYER2 = { "A" => "Rock", "B" => "Paper", "C" => "Scissors" }.freeze

  SHAPE = { "X" => 1, "Y" => 2, "Z" => 3 }.freeze

  def initialize(input)
    @input = input
    @player1, @player2 = input.split(" ")
  end

  def outcome
    return 3 if input == "A X" || input == "B Y" || input == "C Z"
    return 0 if input == "A Z" || input == "C Y" || input == "B X"

    6
  end

  def score
    outcome + SHAPE[player2]
  end
end

# Solution of Day 2 of AOC 2022
class Day02
  attr_reader :input

  def initialize(input)
    @input = input.split("\n")
  end

  def part1
    score = 0
    input.each { |round| score += Round.new(round).score }
    score
  end
end

# Rock defeats Scissors
# Scissors defeats Paper
# Paper defeats Rock

describe Round do
  describe ".outcome" do
    it "computes the outcome of a round if it is a draw" do
      round = Round.new("A X")
      expect(round.outcome).to eq(3)

      round = Round.new("B Y")
      expect(round.outcome).to eq(3)

      round = Round.new("C Z")
      expect(round.outcome).to eq(3)
    end

    it "computes the outcome of a round if it is a loss" do
      round = Round.new("A Z")
      expect(round.outcome).to eq(0)

      round = Round.new("C Y")
      expect(round.outcome).to eq(0)

      round = Round.new("B X")
      expect(round.outcome).to eq(0)
    end

    it "computes the outcome of a round if it is a win" do
      round = Round.new("Z A")
      expect(round.outcome).to eq(6)

      round = Round.new("Y C")
      expect(round.outcome).to eq(6)

      round = Round.new("X B")
      expect(round.outcome).to eq(6)
    end
  end

  describe ".score" do
    it "computes the score of a round" do
      round = Round.new("A X")
      expect(round.score).to eq(4)

      round = Round.new("B Y")
      expect(round.score).to eq(5)

      round = Round.new("C Z")
      expect(round.score).to eq(6)

      round = Round.new("A Z")
      expect(round.score).to eq(3)
    end
  end
end

describe Day02 do
  describe ".part1" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_02_test_1.txt")
      expect(Day02.new(input).part1).to eq(15)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_02_test_2.txt")
      expect(Day02.new(input).part1).to eq(15_337)
    end
  end
end

# A for Rock
# B for Paper
# C for Scissors

# X for Rock
# Y for Paper
# Z for Scissors

# rounds

# The score for a single round is the score for the shape you selected
# (1 for Rock, 2 for Paper, and 3 for Scissors)
# plus the score for the outcome of the round
# (0 if you lost, 3 if the round was a draw, and 6 if you won).

# score = shape + outcome
