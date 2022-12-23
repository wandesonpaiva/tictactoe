# frozen_string_literal: true

require_relative '../src/game'
require_relative '../src/computer'

describe Computer do
  let(:game) { Game.new('c', 'h') }
  let(:computer) { Computer.new(game, 'h') }

  describe '#eval_board' do
    context 'when board is empty should return 4' do
      it { expect(computer.eval_board).to eq(4) }
    end
  end

  describe '#best_move' do
    context 'should win the game' do
      let(:board) { %w[X O 2 3 X 5 6 O 8] }

      before { game.board = board }

      it { expect(computer.best_move).to eq(8) }
    end

    context 'should avoid the opponent victory' do
      let(:board) { %w[X O 2 3 X 5 6 O 8] }

      before { game.board = board }

      it { expect(computer.best_move).to eq(8) }
    end
  end
end
