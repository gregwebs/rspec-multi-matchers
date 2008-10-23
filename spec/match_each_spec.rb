require 'spec/shared_enum_spec'

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
      @line = __LINE__ + 2
      lambda{ [1,2,3].should each { |n|
        n.should == 1
      } }.should raise_error(
        Spec::Expectations::ExpectationNotMetError, /^\s*line: #{@line}\s*item 1: 2\s*#{Regexp.escape(e.message)}/m)
    else fail
    end
  end
end
