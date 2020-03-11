#!/usr/bin/env ruby
require_relative '../lib/game.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

puts 'Welcome to Tic Tac Toe'

puts 'Please enter Player 1 name'
player1 = gets.chomp
puts 'Please enter Player 2 name'
player2 = gets.chomp

game = Game.new
board = Board.new
player = Player.new

puts <<~MLS
      Rule: #{player1} gets the first chance to select a cell from the board.
      Then #{player2} can select a cell. Selection of cell is done by the cell number.
    MLS
puts board.display_board
loop do
  # Input Player X
  puts "#{player1}, select a cell from the above board"
  player1_move = gets.chomp.to_i

  until game.valid_input?(player1_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player1_move = gets.chomp.to_i
  end

  player.player_move('X', player1_move)

  board.board_config('X', player1_move)
  puts board.display_board

  if game.win?(player.player1_cells)
    puts "Hurray! #{player1} has won"
  elsif game.draw?
    puts 'It\'s a draw.'
  end

  break if game.win?(player.player1_cells) || game.draw?

  # Input Player O
  puts "#{player2}, select a cell from the above board"
  player2_move = gets.chomp.to_i

  until game.valid_input?(player2_move)
    puts 'Error! Please enter a cell number that is not filled.'
    player2_move = gets.chomp.to_i
  end

  player.player_move('O', player2_move)

  board.board_config('O', player2_move)
  puts board.display_board

  if game.win?(player.player2_cells)
    puts "Hurray! #{player2} has won"
  elsif game.draw?
    puts 'It\'s a draw.'
  end

  break if game.win?(player.player2_cells) || game.draw?
end
