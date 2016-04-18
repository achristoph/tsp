require 'rspec'
require_relative '../src/matrix_transform'

class MatrixTransformSpec
  include MatrixTransform
end

describe "MatrixTransform Module" do
  let(:subject){ MatrixTransformSpec.new}
  it "tarnsposes rows and collums of a nested array" do
            # 0,  1,   2,   3,   4
    tst = [["*", "*", "C", "*", "E"], #0
           ["*", "*", "H", "*", "J"], #1
           ["K", "L", "M", "N", "O"], #2
           ["*", "*", "R", "*", "T"], #3
           ["U", "V", "W", "X", "Y"]] #4

    #2<->4:  0,   1,   4,   3,   2
    exp = [["*", "*", "E", "*", "C"], #0
           ["*", "*", "J", "*", "H"], #1
           ["U", "V", "Y", "X", "W"], #4
           ["*", "*", "T", "*", "R"], #3
           ["K", "L", "O", "N", "M"]] #2
    expect(subject.transform(tst, "01234", "01432")).to eq(exp)
  end

  it "does not transpose other values of nested array" do

            # 0,  1,   2,   3,   4
    tst = [["A", "B", "*", "D", "*"], #0
           ["F", "G", "*", "I", "*"], #1
           ["*", "*", "*", "*", "*"], #2
           ["P", "Q", "*", "S", "*"], #3
           ["*", "*", "*", "*", "*"]] #4

    #2<->4:  0,   1,   4,   3,   2
    exp = [["A", "B", "*", "D", "*"], #0
           ["F", "G", "*", "I", "*"], #1
           ["*", "*", "*", "*", "*"], #4
           ["P", "Q", "*", "S", "*"], #3
           ["*", "*", "*", "*", "*"]] #2
    expect(subject.transform(tst, "01234", "01432")).to eq(exp)
  end

end