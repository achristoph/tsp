require_relative "tsp_table"

class TspRunner
  attr_accessor :cities, :table, :permutations, :optimal_path, :optimal_dist
  def initialize(cities)
    @cities       = cities
    @table        = TspTable.new(cities)
    @permutations = set_permutations(cities)
    @optimal_path 
    @optimal_dist 
    initialize_optimums
  end

  def initialize_optimums
    # set optimals to tables initial values
    self.optimal_path = table.permutation
    self.optimal_dist = table.eval

    # delete default table permutation from permutation collection
    permutations.delete(optimal_path)
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
    distance = table.new_permutation(perm)
    if (distance < optimal_dist)
      self.optimal_path = perm
      self.optimal_dist = distance
    end
  end
end