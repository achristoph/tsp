require 'rspec'
require_relative '../src/tsp_runner'

describe TspRunner do

  describe "initialize" do
    it 'populate distance table correctly' do
      sample_cities = [[0, 0], [3, 4]]
      subject = TspRunner.new(sample_cities)
      expect(subject.distance_table[0][1]).to eq(5)
    end
  end
end



