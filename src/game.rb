# frozen_string_literal: true

require_relative 'computer'

class Game
  VICOTRY_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  attr_accessor :board

  def initialize(mode, difficult)
    @board = %w[0 1 2 3 4 5 6 7 8]
    @mode = mode
    @difficult = difficult
    @computer = Computer.new(self, difficult) if vs_com?
  end

  def available_spaces
    @board.reject { |s| %w[O X].include?(s) }
  end

  def ongoing?
    !win? && !tie?
  end

  def eval_board
    position = @computer.eval_board
    @board[position] = 'X'
  end

  def win?(b = board)
    VICOTRY_COMBINATIONS.each do |c|
      a = []

      b.select.with_index { |y, k| a << y if c.include?(k) }

      return true if a.uniq.length == 1
    end

    false
  end

  def tie?
    @board.all? { |s| %w[X O].include?(s) }
  end

  def vs_com?
    @mode == 'c'
  end

  def vs_hum?
    @mode == 'h'
  end
end
