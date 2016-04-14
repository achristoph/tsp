require_relative '../lib/main'

describe 'a' do
  # it 'calculate correct distance of 5' do
  #   cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
  #   tsp = TSP.new(cities)
  #   expect(tsp.distance([0,0], [4,3])).to eq(5)
  # end
  #
  # it 'calculate correct distance between same point' do
  #   cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
  #   tsp = TSP.new(cities)
  #   expect(tsp.distance([1,2], [1,2])).to eq(0)
  # end

  # it 'populate distance correctly' do
  #   cities = [[0, 0], [1, 1]]
  #   tsp = TSP.new(cities)
  #   expect(tsp.distance_table.size).to eq(2)
  #   expect(tsp.compute[0][0]).to eq(0)
  # end

  it 'populate distance correctly' do
    cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
    tsp = TSP.new(cities)
    expect(tsp.compute[0][1]).to eq(0)
  end

end



