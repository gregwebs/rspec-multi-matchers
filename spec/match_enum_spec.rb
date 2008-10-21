require 'spec/shared_enum_spec'

describe MatchEnum do
  it_should_behave_like "each matcher"

  before do
    @class = MatchEnum
    @iterator = [:enum, :each]
  end

  it 'should enum with each_with_index' do
    [1,2,3].should enum(:each_with_index) { |n,i| n.should == i + 1 }
  end
end
