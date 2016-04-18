require 'rspec'
require_relative '../src/tsp_table'

describe TspTable do
  describe "initialize" do
    it 'populate distance table correctly' do
      sample_cities = [[0, 0], [3, 4]]
      subject = TspTable.new(sample_cities)
      expect(subject.distance_table[0][1]).to eq(5)
    end
  end
end