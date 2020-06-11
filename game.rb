require_relative "player"
require_relative "board"

module Moves
  
  def legal_move?(move)
    legal_moves = %w[a1 a2 a3 b1 b2 b3 c1 c2 c3]
    legal_moves.include?(move)
  end

  def get_move_indices(move)
    # Translate 'a1, 'b2', etc. into i, j indices  a 3x3 matrix.
    row, col = move.split('')
    i = row.downcase.ord - 97
    j = col.to_i - 1
    [i, j]
  end
end

class Game
  include Moves

  def initialize
    @player_1 = Player.new('x')
    @player_2 = Player.new('o')
    @board = Board.new
  end

  def get_move
    move = gets.chomp
    unless legal_move?(move)
      puts 'Move illegal'
      return false
    end
    i, j = get_move_indices(move)
    unless @board.move_avail?(i, j)
      puts 'Move unavailable'
      return false
    end
    [i, j]
  end

  def add_move(move, player)
    i, j = move
    @board.add_move(i, j, player.symbol)
    player.add_move(i, j)
  end

  def play
    puts 'Moves should be entered in <x_coord><y_coord> format (e.g. a1, c2)'
    @board.print_board
    player_toggle = 0
    loop do
      player = player_toggle.zero? ? @player_1 : @player_2
      puts "Player #{player_toggle + 1} (#{player.symbol}), make a move:"
      move = self.get_move
      next unless move # If invalid move, prompt same player again

      add_move(move, player)
      if player.player_won?
        puts "Player #{player_toggle + 1 } won!"
        @board.print_board
        return
      end
      @board.print_board
      player_toggle = 1 - player_toggle
    end
  end
end
