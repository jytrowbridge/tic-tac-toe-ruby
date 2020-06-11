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