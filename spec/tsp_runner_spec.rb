require 'rspec'
require_relative '../src/tsp_runner'
require_relative '../src/tsp_table'

describe TspRunner do
  xy_coordinates = [[0, 0], [0, 3], [4, 3]]
  sampe_promblem_coordinates = [[0,0], [1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
  let(:subject){ TspRunner.new(xy_coordinates) }
  let(:table){ TspTable.new(xy_coordinates)}
  let(:sample_problem){ TspRunner.new(sampe_promblem_coordinates)}

  describe "initialize" do
    it "generates a collection of possible permutations (excluding table default)" do
      expected = [0,1,2].permutation.to_a.map{|perm| perm.map(&:to_s).reduce(&:+)}
      expected.delete(table.permutation)
      expect(subject.permutations).to eq(expected)
    end

    it "sets optimal path as table's default permutation" do
      expect(subject.optimal_path).to eq(table.permutation)
    end

    it "sets optimal distance as distance of table's default permutation" do
      expect(subject.optimal_dist).to eq(table.eval)
    end
  end

  describe "solve" do
    it "returns the first occuring path-permutation of minimized distance; [path, distance]"do
      expect(subject.solve).to eq(["012", 12.0])
    end
    it "solves the sample problem" do
      path, distance = sample_problem.solve

      expect(path).to eq("051234")
      expect(distance).to be_within(0.01).of(32)
    end
  end
end