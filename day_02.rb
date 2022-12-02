require "pry"
require "rspec/autorun"

# https://adventofcode.com/2022/day/2

# This class design a round of a Rock, Paper, Scissors game.
class Round
  attr_reader :player1, :player2, :input

  LOSS_SCORE = 0
  WIN_SCORE = 6
  DRAW_SCORE = 3

  MAPPING_SHAPE_PLAYER1 = {
    "A" => "rock",
    "B" => "paper",
    "C" => "scissors"
  }.freeze
  MAPPING_SHAPE_PLAYER2 = {
    "X" => "rock",
    "Y" => "paper",
    "Z" => "scissors"
  }.freeze

  OUTCOMES = {
    "rock rock": DRAW_SCORE,
    "paper paper": DRAW_SCORE,
    "scissors scissors": DRAW_SCORE,
    "rock scissors": LOSS_SCORE,
    "scissors paper": LOSS_SCORE,
    "paper rock": LOSS_SCORE,
    "rock paper": WIN_SCORE,
    "paper scissors": WIN_SCORE,
    "scissors rock": WIN_SCORE
  }.freeze

  PLAYER2_PART_2 = {
    "X" => {
      "rock" => "scissors",
      "paper" => "rock",
      "scissors" => "paper"
    },
    "Y" => {
      "rock" => "rock",
      "paper" => "paper",
      "scissors" => "scissors"
    },
    "Z" => {
      "rock" => "paper",
      "paper" => "scissors",
      "scissors" => "rock"
    }
  }.freeze

  SCORE_SHAPE = { "rock" => 1, "paper" => 2, "scissors" => 3 }.freeze

  def initialize(input, part2: false)
    @player1, @player2 = input.split(" ")
    @player1 = MAPPING_SHAPE_PLAYER1[player1]
    @player2 =
      part2 ? PLAYER2_PART_2[player2][player1] : MAPPING_SHAPE_PLAYER2[player2]
    @input = "#{@player1} #{@player2}"
  end

  def outcome
    OUTCOMES[input.to_sym]
  end

  def score
    outcome + SCORE_SHAPE[player2]
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

  def part2
    score = 0
    input.each { |round| score += Round.new(round, part2: true).score }
    score
  end
end

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
      round = Round.new("A Y")
      expect(round.outcome).to eq(6)

      round = Round.new("B Z")
      expect(round.outcome).to eq(6)

      round = Round.new("C X")
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

  describe ".part2" do
    it "returns the right value for the test file 1" do
      input = File.read("inputs/day_02_test_1.txt")
      expect(Day02.new(input).part2).to eq(12)
    end

    it "returns the right value for the test file 2" do
      input = File.read("inputs/day_02_test_2.txt")
      expect(Day02.new(input).part2).to eq(11_696)
    end
  end
end
