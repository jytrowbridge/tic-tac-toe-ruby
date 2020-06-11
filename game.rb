require_relative "player"
require_relative "board"
require_relative "moves"

class Game
  include Moves

  def initialize
    @player1 = Player.new('x')
    @player2 = Player.new('o')
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
      player = player_toggle.zero? ? @player1 : @player2
      puts "Player #{player_toggle + 1} (#{player.symbol}), make a move:"
      move = get_move
      next unless move # If invalid move, prompt same player again

      add_move(move, player)
      if player.player_won?
        puts "Player #{player_toggle + 1} won!"
        @board.print_board
        return
      end
      if @board.draw?
        puts 'Game is a draw'
        return
      end
      @board.print_board
      player_toggle = 1 - player_toggle
    end
  end

  private :get_move, :add_move
end
