require 'spec_helper'
require 'tictactoe_core/factory/board_factory'


module TicTacToeCore
  module Factory
    describe BoardFactory do
      let(:board_factory) { BoardFactory.new }

      it 'creates a new board' do
        board = board_factory.create(0)
        expect(board.is_a?(Board)).to be true
      end

      it 'creates a new 2 by 2 board' do
        board = board_factory.create(BoardFactory::TWO_BOARD)
        expect(board.dimension).to eq(2)
      end

      it 'creates a new 3 by 3 board' do
        board = board_factory.create(BoardFactory::THREE_BOARD)
        expect(board.dimension).to eq(3)
      end

      it 'creates a new 4 by 4 board' do
        board = board_factory.create(BoardFactory::FOUR_BOARD)
        expect(board.dimension).to eq(4)
      end

      it 'creates a board from a string' do
        board = board_factory.create_from_string("3x3")
        expect(board.dimension).to eq(3)
      end

    end
  end
end
