require 'spec_helper'
require 'tictactoe_core/ai/minimax_ai'
require 'tictactoe_core/factory/players_factory'
require 'tictactoe_core/game'
require 'tictactoe_core/board'
require 'tictactoe_core/board_helper'

module TicTacToeCore
  describe 'check full games end in draw with minimax', :slow => true do
    let(:ui) { Fakes::UiMock.new }
    let(:ai) { Ai::MinimaxAi.new }
    let(:player_factory) { Factory::PlayersFactory.new(ui, ai) }
    let(:players) { player_factory.create(Factory::PlayersFactory::CVC_GAME_TYPE) }

    it 'plays 5 games and all end in a draw' do
      5.times do |i|
        game = Game.new(Board.make_board(4), players, ui)
        game.run
        expect(game.end_game_state).to eq(Board::DRAW)
      end
    end

    it 'draws in a previously winning game setup' do
      board = BoardHelper.create_initial_board_four('-OX-O-----X----X')
      game = Game.new(board, players, ui)
      game.update_current_player
      game.run
      expect(game.end_game_state).to eq(Board::DRAW)
    end

    it 'draws in a previously winning game setup 2' do
      board = BoardHelper.create_initial_board_four('O--X----O--X--X-')
      game = Game.new(board, players, ui)
      game.update_current_player
      game.run
      expect(game.end_game_state).to eq(Board::DRAW)
    end

    it 'plays a C v C game to a draw' do
      game = Game.new(Board.make_board(4), players, ui)
      game.run
      expect(game.end_game_state).to eq(Board::DRAW)
    end
  end
end
