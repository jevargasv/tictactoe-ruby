require 'spec_helper.rb'
require_relative '../lib/board'
require_relative '../lib/game'
require_relative '../lib/player'

RSpec.describe Board do

    describe 'Functionality of #board_config' do
        subject {Board.new}
        
        it 'check if the board position is replaced with symbol X' do
            subject.board_config('X', 1)
            expect(subject.board).to eql(['X',2,3,4,5,6,7,8,9])
        end

        it 'check if the board position is replaced with symbol O' do
            subject.board_config('O', 5)
            expect(subject.board).to eql([1,2,3,4,'O',6,7,8,9])
        end
    end    
end

RSpec.describe Game do
    let(:game) {Game.new}

    describe "#valid_input?" do
        it 'return true if input is in @available_cells array' do
            expect(game.valid_input?(4)).to eql(true)
        end

        it 'returns false if input is not in @available_cells array' do
            expect(game.valid_input?(0)).to eql(false)
        end
    end

    describe "#delete_available_cells" do
        it 'deletes the given move from @available_cells array' do
            game.delete_available_cells(6)
            expect(game.available_cells).to eql([1,2,3,4,5,7,8,9])
        end
    end

    describe 'win?' do
        it 'returns true if the array of player moves is in winning_condition array' do
            expect(game.win?([9,7,8])).to eql(true)
        end

        it 'returns false if the array of player moves is not in winning_condition array' do
            expect(game.win?([1,4,9])).to eql(false)
        end
    end

    describe 'draw?' do
        it 'returns true if the @available_cells array is empty' do
            game.available_cells = []
            expect(game.draw?).to eql(true)
        end

        it 'returns false if the @available_cells array is not empty' do
            expect(game.draw?).to eql(false)
        end
    end
end