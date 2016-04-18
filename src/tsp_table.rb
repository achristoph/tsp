require_relative "tsp_evaluator"
require_relative "matrix_transform"

class TspTable
  include MatrixTransform, TspEvaluator
  attr_accessor :cities, :distance_table
  attr_reader   :permutation

  def initialize(cities)
    @cities         = cities
    @distance_table = Array.new(cities.size) { [] }
    @permutation    = (0...cities.size).map{|i| i.to_s}.reduce(:+)
    compute
  end

  def compute
    cities.each_with_index do |c, i|
      cities.each_with_index do |d, j|
        self.distance_table[i][j] = distance(c, d)
      end
    end
  end

  def distance(a, b)
    x2, x1 = b.first, a.first
    y2, y1 = b.last, a.last
    Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  end

  def permutation=(new_perm)
    self.distance_table = transform.(distance_table, permutation, new_perm)
    @permutation = new_perm
    evaluate
  end

  def evaluate
  #   self.permutation = _permutation
    evaluate.(self.distance_table)
  end
end