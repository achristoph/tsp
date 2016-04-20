require 'rspec'
require_relative '../src/tsp_table'

describe TspTable do
  xy_cord_cities = [[0, 0],[3, 0],[3, 4]]
  let(:subject){ TspTable.new(xy_cord_cities)}

  describe "initialize" do
    it 'populate distance table correctly' do
      expect(subject.distance_table[0][1]).to eq(3)
    end
  end

  describe "evaluate" do
    it "provides the evaluated distance for current tbl permutation" do
      expect(subject.eval).to be_within(0.001).of(12)
    end
  end

  describe "#permutation=()" do
    it "updates permutation attribute" do
      subject.new_permutation("021")
      expect(subject.permutation).to eq("021")
    end
    it "updates the distance table to match the new permutation" do
      subject.new_permutation("021")
                                            # 0    2    1
      expect(subject.distance_table).to eq([[0.0, 5.0, 3.0],  #0
                                            [5.0, 0.0, 4.0],  #2
                                            [3.0, 4.0, 0.0]]) #1
    end
    it "returns the loop distance of the new permutation" do
      expect(subject.new_permutation("021")).to eq(12)
    end
  end
end