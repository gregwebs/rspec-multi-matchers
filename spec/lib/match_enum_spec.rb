require File.dirname(__FILE__) + '/../spec_helper'

describe MatchEnum do
  it_should_behave_like "each matcher"

  before do
    @class = MatchEnum
    @iterator = [:enum, :each]
  end

  it 'should enum with each_with_index' do
    [1,2,3].should enum(:each_with_index) { |n,i| n.should == i + 1 }
  end

  it 'should enum with each_slice' do
    acc = []
    [1,2,3].should enum(:each_cons, 2) { |(x,y)|
      acc << [x,y]
      x.should_not == y
    }
    acc.should == [[1,2],[2,3]]
  end
end
