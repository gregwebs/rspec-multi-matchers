shared_examples_for "each matcher" do
  it 'should raise an error when a block is not given' do
    # do...end does not bind strongly enough, must use brackets
    lambda do
      [1,2,3].should send(*@iterator) do |n| n.should == n end
    end.should raise_error(@class::NoBlockGivenError)
  end

  it 'should not raise an error for met expectations' do
    i = 0
    [1,2,3].should send(*@iterator) {|n| n.should == (i+=1)}
  end

  it 'should raise an error if there are no items in the enumerable object' do
    lambda{ [].should send(*@iterator){} }.should raise_error(@class::BlankEnumerableError, /.*/)
    [false, nil].each do |f|
      @iterator.push(:empty => f)
      lambda{ [].should send(*@iterator){}}.should raise_error(@class::BlankEnumerableError)
      @iterator.pop
    end
  end

  it 'should not raise an error if there are no items in the enumerable object and the empty flag is passed' do
    ['okay', true].each do |t|
      @iterator.push(:empty => t)
      lambda{ [].should send(*@iterator){} }.should_not raise_error
      @iterator.pop
    end
  end
end
