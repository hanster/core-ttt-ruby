require 'spec_helper'
require 'tictactoe/player/computer_player'
require 'tictactoe/marker'
require 'tictactoe/board_helper'
require 'tictactoe/ai/minimax_ai'

module TicTacToe
  module Player
    describe ComputerPlayer do
      let(:marker) { Marker::X_MARKER }
      let(:ai) { instance_double(TicTacToe::Ai::MinimaxAi) }
      let(:player) { ComputerPlayer.new(ai, marker) }

      it "has a set marker after initialization" do
        expect(player.marker).to eq(marker)
      end

      it "asks ai for next move" do
        expect(ai).to receive(:calculate_next_move).and_return(0)
        board = BoardHelper.create_initial_board_three('-OOOXXXOO')
        expect(player.next_move(board)).to eq(0)
      end
    end
  end
end
