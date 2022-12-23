# frozen_string_literal: true

require_relative '../src/game'

describe Game do
  let(:game) { Game.new('h', nil) }

  describe '#available_spaces' do
    context 'when game has 9 available spaces' do
      it { expect(game.available_spaces.count).to eq(9) }
    end

    context 'when game has 0 available spaces' do
      let(:board) { %w[O X O X X O X O X] }

      before { game.board = board }

      it { expect(game.available_spaces.count).to eq(0) }
    end
  end

  describe '#ongoing?' do
    context 'when is true' do
      it { expect(game.ongoing?).to eq(true) }
    end

    context 'when game is over' do
      let(:board) { %w[X O 2 3 X 5 O 7 X] }

      before { game.board = board }

      it { expect(game.ongoing?).to eq(false) }
    end

    context 'when game is tie' do
      let(:board) { %w[O X O X X O X O X] }

      before { game.board = board }

      it { expect(game.ongoing?).to eq(false) }
    end
  end

  describe '#win?' do
    context 'player win in diagonal' do
      let(:board) { %w[X O 2 3 X 5 O 7 X] }

      it { expect(game.win?(board)).to eq(true) }
    end

    context 'player win in vertical' do
      let(:board) { %w[X O 2 X 4 5 X 7 O] }

      it { expect(game.win?(board)).to eq(true) }
    end

    context 'player win in horizontal' do
      let(:board) { %w[X X X O 4 5 O 7 8] }

      it { expect(game.win?(board)).to eq(true) }
    end
  end

  describe '#tie?' do
    context 'when is true' do
      let(:board) { %w[O X O X X O X O X] }

      before { game.board = board }

      it { expect(game.tie?).to eq(true) }
    end

    context 'when is false' do
      it { expect(game.tie?).to eq(false) }
    end
  end

  describe '#vs_com?' do
    context 'when is true' do
      let(:game) { Game.new('c', 'e') }

      it { expect(game.vs_com?).to eq(true) }
    end

    context 'when is false' do
      it { expect(game.vs_com?).to eq(false) }
    end
  end

  describe '#vs_hum?' do
    context 'when is true' do
      it { expect(game.vs_hum?).to eq(true) }
    end

    context 'when is false' do
      let(:game) { Game.new('c', 'h') }

      it { expect(game.vs_hum?).to eq(false) }
    end
  end
end
