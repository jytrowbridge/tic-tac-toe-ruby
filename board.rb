class Board
  def initialize
    @squares = [['', '', ''], ['', '', ''], ['', '', '']]
  end

  def move_avail?(i, j)
    @squares[j][i] == ''
  end

  def add_move(i, j, symbol)
    @squares[j][i] = symbol
  end

  def draw?
    @squares.reduce(true) do |result, row|
      result && row.reduce(true) { |row_result, square| row_result && square != '' }
    end
  end

  def print_board
    padding = 1
    hz_line = "\n  " + '-' * ((2 + padding * 2) * 3 + 1)

    # row header:
    print '   '
    (0..2).to_a.each do |ind|
      print ' ' * padding + (97 + ind).chr + ' ' * (padding + 1)
    end
    puts hz_line

    # rows:
    @squares.each_with_index do |row, idx|
      print "#{idx + 1} |"
      row.each do |square|
        square = square == '' ? ' ' : square
        print ' ' * padding + square + ' ' * padding + '|'
      end
      puts hz_line
    end
  end
end
