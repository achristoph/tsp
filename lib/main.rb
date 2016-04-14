require 'rspec'

class TSP
  attr_accessor :cities, :distance_table

  def initialize(cities)
    @cities = cities
    @distance_table = Array.new(cities.size) { Array.new(cities.size) }
  end

  def compute
    distance_table
    cities.each_with_index do |c, i|
      cities.each_with_index do |d, j|
        distance_table[i][j] = distance(c, d)
        p "#{i},#{j} - #{c},#{d} #{distance(c, d)}"
      end
    end
    distance_table
  end

  def distance(a, b)
    x2, x1 = b.first, a.first
    y2, y1 = b.last, a.last
    Math.sqrt((x2-x1)**2 + (y2-y1)**2)
  end
end


