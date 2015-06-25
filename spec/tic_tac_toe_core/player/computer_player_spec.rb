require 'spec_helper'
require 'tic_tac_toe_core/player/computer_player'
require 'tic_tac_toe_core/marker'
require 'tic_tac_toe_core/board_helper'
require 'tic_tac_toe_core/ai/minimax_ai'

module TicTacToeCore
  module Player
    describe ComputerPlayer do
      let(:marker) { Marker::X_MARKER }
      let(:ai) { instance_double(TicTacToeCore::Ai::MinimaxAi) }
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
