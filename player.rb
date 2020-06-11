class Player
  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
    @board = [[false, false, false], [false, false, false], [false, false, false]]
  end

  def add_move(i, j)
    # Add move for current player, given its i and j coordinates
    @board[j][i] = true
  end

  def player_won?
    # Check each row:
    @board.each do |row|
      return true if arr_and(row)
    end

    # Check each column:
    (0..2).to_a.each do |col_num|
      col = []
      @board.each do |row|
        col << row[col_num]
      end
      return true if arr_and(col)
    end

    # Check diagonals:
    diag_one = [@board[0][0], @board[1][1], @board[2][2]]
    diag_two = [@board[2][0], @board[1][1], @board[0][2]]
    return arr_and(diag_one) || arr_and(diag_two)
  end

  private

  def arr_and(arr)
    arr.reduce(true) { |result, current| current && result }
  end

end