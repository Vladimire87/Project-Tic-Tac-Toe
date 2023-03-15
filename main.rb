# frozen_string_literal: true

require 'pry'

board = (1..9).to_a
player_1 = []
player_2 = []
player_x = []
player_y = []

def cls
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def display(board)
  puts
  puts      "                    #{board[0]} | #{board[1]} | #{board[2]} "
  puts      '                   ---+---+---'
  puts      "                    #{board[3]} | #{board[4]} | #{board[5]} "
  puts      '                   ---+---+---'
  puts      "                    #{board[6]} | #{board[7]} | #{board[8]} "
  puts
end

def display_x(board, player)
  board[player - 1] = 'x'
  display(board)
end

def display_o(board, player)
  board[player - 1] = 'O'
  display(board)
end

display(board)

p board

until board.none? { |element| element.is_a?(Integer) }
  puts 'Player 1 = X Choose 1 to 9'
  player_1 = gets.chomp.to_i
  until board.include?(player_1)
    puts "#{player_1} not availble"
    player_1 = gets.chomp.to_i
  end

  if board.include?(player_1)
    player_x << player_1
    board[player_1 - 1] = player_1
    cls
    display_x(board, player_1)
    p board
    p player_x
  end

  if board.none? { |element| element.is_a?(Integer) }
    abort "Draw"
  end

  puts 'Player 2 = O Choose 1 to 9'
  player_2 = gets.chomp.to_i
  until board.include?(player_2)
    puts "#{player_2} not availble"
    player_2 = gets.chomp.to_i
  end

  if board.include?(player_2)
    player_y << player_2
    board[player_2 - 1] = player_2
    cls
    display_o(board, player_2)
    p board
    p player_y
  end
end
