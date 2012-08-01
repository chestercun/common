require 'spec_helper'

# string class
describe String do
  before do
    @str = "racecar"
  end

  subject { @str }

  it { should respond_to(:palindrome?) }
  it { should be_palindrome }

  describe "palindrome feature" do
    before do
      @str = 'not racecar'
    end
    it { should_not be_palindrome }
  end
end

# array class
describe Array do
  before do
    @dummy = Array.new
    @dummy.push(5,2,9,19,11)
  end
  subject { @dummy }

  it { should respond_to(:%) }

  it "should be mod 2" do
    (@dummy % 2).should == true
  end
  it "should not be mod 4" do
    (@dummy % 4).should == false
  end
end

# queue
describe Common::Queue do
  before do
    @q = Common::Queue.new
  end
  subject { @q }

  it { should respond_to(:size) }
  it { should respond_to(:push) }
  it { should respond_to(:pop) }

  describe "pushing and popping" do
    before do
      @q.push(4,5,2)
    end

    its(:size) { should_not be_zero }
    its(:size) { should == 3 }
    it { should_not be_empty }

    it "should lose values after pop" do
      2.times { @q.pop }
      @q.size.should_not be_zero
      @q.size.should == 1
    end
  end
end

# vertex
describe Common::Vertex do
  before do
    @v1 = Common::Vertex.new('v1')
  end
  subject { @v1 }
  it { should respond_to(:reset) }
  it { should respond_to(:visited?) }
  it { should respond_to(:addAdj) }
  it { should respond_to(:neighbors) }

  describe "visit and reset vertex" do
    before { @v1.visited = true }
    it { should be_visited }
    it "should set visited to false after reset" do
      @v1.reset
      @v1.should_not be_visited
    end
  end

  describe "adding adjacent vertices" do
    before do
      @v2 = Common::Vertex.new('v2')
      @v1.addAdj @v2
    end
    it "should have v2 as one of its neighbors" do
      @v1.neighbors.should include(@v2)
    end
  end
end

# DSL's
describe Common::DSL do
  subject { self }
  it { should respond_to(:time) }

  xit "should have a time method" do
  end
end

