module Moves
  def get_move_indices(move)
    # Translate 'a1, 'b2', etc. into i, j indices for a 3x3 matrix.
    row, col = move.split('')
    i = row.downcase.ord - 97
    j = col.to_i - 1
    [i, j]
  end
end
