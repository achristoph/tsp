require_relative "tsp_table"

class TspRunner
  attr_accessor :cities, :table, :permutations, :optimal_path, :optimal_dist
  def initialize(cities)
    @cities       = cities
    @table        = TspTable.new(cities)
    @permutations = set_permutations(cities)
    @optimal_path #= permutations.unshift #sets the "0123..n" permutation as default
    @optimal_dist #= table.evaluate(optimal_path)
    initialize_optimums
  end

  def initialize_optimums
    self.optimal_path = permutations.unshift #sets the "0123..n" permutation as default
    self.optimal_dist = table.evaluate
  end

  def solve
    permutations.each do |permutation|
      increment_optimal(permutation)
    end
    [optimal_path, optimal_dist]
  end

  def set_permutations(cities)
    (0...cities.length).to_a.permutation.to_a.map{|perm| perm.map(&:to_s).reduce(&:+)}
  end

  def increment_optimal(perm)
    distance = table.permutation=(perm)
    if (distance < optimal_dist)
      self.optimal_path = perm
      self.optimal_dist = distance
    end
  end
end