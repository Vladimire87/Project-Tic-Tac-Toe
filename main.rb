# frozen_string_literal: false

require 'colorize'

LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],
  [1, 4, 7], [2, 5, 8], [3, 6, 9],
  [1, 5, 9], [3, 5, 7]
].freeze
board = (1..9).to_a
player1 = []
player2 = []

def cls
  Gem.win_platform? ? (system 'cls') : (system 'clear')
end

def check_winner(player_moves, symbol)
  number = player_moves
  new_lines = LINES.map do |line|
    line.map! { |num| num == number ? symbol : num }
  end

  new_lines.each do |line|
    if line.all? { |value| value == symbol }
      puts "OK! It is WIN for #{symbol}"
      abort
    end
  end
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
  cls
  check_winner(player, 'x')
  board[player - 1] = 'x'.colorize(:red)
  display(board)
end

def display_o(board, player)
  cls
  check_winner(player, 'O')
  board[player - 1] = 'O'.colorize(:yellow)
  display(board)
end

display(board)

p board

until board.none? { |element| element.is_a?(Integer) }
  puts 'Player 1 = X Choose 1 to 9'
  player1 = gets.chomp.to_i
  until board.include?(player1)
    puts "#{player1} not availble"
    player1 = gets.chomp.to_i
  end

  if board.include?(player1)
    board[player1 - 1] = player1
    display_x(board, player1)
  end

  abort 'No one won! Friendship !!! <3 <3 <3' if board.none? { |element| element.is_a?(Integer) }

  puts 'Player 2 = O Choose 1 to 9'
  player2 = gets.chomp.to_i
  until board.include?(player2)
    puts "#{player2} not availble"
    player2 = gets.chomp.to_i
  end

  next unless board.include?(player2)

  board[player2 - 1] = player2
  display_o(board, player2)
end
