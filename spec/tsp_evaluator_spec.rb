require 'rspec'
require_relative '../src/tsp_evaluator'

class TspEvaluatorSpec
  include TspEvaluator
end

describe "TspEvaluator Module" do
  let(:subject) { TspEvaluatorSpec.new }
  it "evaluates the distance of the looped traveled in permutation order" do
  # ie, for per 01234, it sums (0->1 + 1->2 + 2->3 + 3->4 + 4->0)
           # 0,   1,   2,   3,   4
    tst = [["*",  1,  "*", "*",  7 ], #0
           ["*", "*",  2,  "*", "*"], #1
           ["*", "*", "*",  3,  "*"], #2
           ["*", "*", "*", "*",  5 ], #3
           ["*", "*", "*", "*", "*"]] #4
    expect(subject.evaluate(tst)).to eq(18)
  end

end