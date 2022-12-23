# frozen_string_literal: true

class Computer
  COM = 'X'
  HUM = 'O'

  def initialize(game, difficult)
    @difficult = difficult
    @game = game
  end

  def eval_board
    if @difficult == 'h'
      best_move
    else
      random_move
    end
  end

  def best_move
    board = @game.board
    return 4 if board[4] == '4'

    @game.available_spaces.each do |as|
      board[as.to_i] = COM
      return as.to_i if @game.win?(board)

      board[as.to_i] = HUM
      return as.to_i if @game.win?(board)

      board[as.to_i] = as
    end

    random_move
  end

  def random_move
    @game.available_spaces.sample.to_i
  end
end
