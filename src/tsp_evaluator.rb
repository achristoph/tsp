module TspEvaluator
  def evaluate(table)
    accumulator = 0
    table.each.with_index(1) do |row, index|
      break if index == row.length # ends before last row
      accumulator += row.last if index == 1 # adds [0][n] position
      accumulator += row[index] # adds [n][n+1] position
    end
    accumulator
  end
end