require 'spec/shared_enum_spec'

describe MatchEnum do
  it_should_behave_like "each matcher"

  before do
    @class = MatchEnum
    @iterator = [:enum, :each]
  end
end

describe MatchEach do
  it_should_behave_like "each matcher"

  before do
    @class = MatchEach
    @iterator = [:each]
  end

  it 'should add to the inner error message' do
    begin
      2.should == 1
    rescue Spec::Expectations::ExpectationNotMetError => e
      lambda{ [1,2,3].should each { |n|
        n.should == 1
      } }.should raise_error(
        Spec::Expectations::ExpectationNotMetError, /^\s*line: 25\s*item 1: 2\s*#{Regexp.escape(e.message)}/m)
    else fail
    end
  end
end
