require 'rspec'
require_relative '../src/tsp_runner'

describe TspRunner do
  xy_city_coordinates = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
  let(:subject){ TspRunner.new(xy_city_coordinates) }

  mini_coordinates    = [[0, 0], [0, 3], [4, 3]]
  let(:mini_subject){ TspRunner.new(mini_coordinates) }

  describe "permutations" do
    it "populates a string list of permutations"do
      expect(mini_subject.permutations).to eq(["012", "021", 
                                               "102", "120", 
                                               "201", "210"])
    end
  end

  
end