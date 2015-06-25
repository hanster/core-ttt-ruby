module TicTacToeCore
  module Player
    class ComputerPlayer
      attr_reader :marker
      def initialize(ai, marker)
        @ai = ai
        @marker = marker
      end

      def next_move(board)
        return board.available_moves.sample if first_five_moves_for_four_by_four?(board)
        @ai.calculate_next_move(board, @marker)
      end

      private

      def first_five_moves_for_four_by_four?(board)
        board.available_moves.count > 11
      end
    end
  end
end
