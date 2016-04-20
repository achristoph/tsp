module MatrixTransform
  def transform(_table, old_permutation, new_permutation)
    pos1, pos2 = positions(old_permutation.split("").map(&:to_i), new_permutation.split("").map(&:to_i))
    table = _table.clone
    swap_columns(table, pos1, pos2)
    swap_rows(table, pos1, pos2)
    table
  end

  def swap_columns(table, position1, position2)
    table.each do |row|
      swap_positions(row, position1, position2)
    end
  end

  def swap_rows(table, position1, position2)
    swap_positions(table, position1, position2)
  end

  def swap_positions(ary, position1, position2)
    cache          = ary[position1]
    ary[position1] = ary[position2]
    ary[position2] = cache
  end

  def positions(old_perm, new_perm)
    old_perm.each_with_index do |pos, i|
      return [old_perm[i], new_perm[i]] if (old_perm[i] != new_perm[i])
    end
  end
end
