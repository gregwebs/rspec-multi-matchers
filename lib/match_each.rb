class MatchEach

  class MatchEachError < Exception; end
  class NoBlockGivenError < MatchEachError; end

  class BlankEnumerableError < MatchEachError; end

  def initialize(options, &block)
    @empty_okay = (options and options[:empty])
    unless @block = block
      raise NoBlockGivenError, 'No block given. You probably need to use brackets "{...}" instead of "do...end"'
    end
  end

  def matches?(target)
    if target.nil?
      raise BlankEnumerableError, "Expected an enumerable object, but got nil"
    end

    if !@empty_okay && target.empty?
      raise BlankEnumerableError, "No items in the given enumerator.\nTo allow an empty enumerator pass the :empty option with a true value"
    end

    @counter = 0
    target.each do |obj|
      begin
        @block.call(obj)
      rescue Spec::Expectations::ExpectationNotMetError => e
        @error = e
        @failure_object = obj
        return false
      end
      @counter += 1
    end
    true
  end

  def object_description
    insp = @failure_object.inspect
    return insp if insp.length < 300

    if @failure_object.respond_to?(:to_s)
      str = @failure_object.to_s
      return str if str .length < 300
    end

    insp[0..300] + ' ... '
  end
  
  def failure_line
    # find 'matches?' in statck trace
    # then move back to the first line number that is not a function call
    error_line = nil
    @error.backtrace.each do |line|
      if line.match(/:\d+:in\s*[`'"](.*)[`'"]\s*$/)
        return error_line if $1 == 'matches?'
      else
        error_line = line.match(/^[^:]+:(\d+)/)[1]
      end
    end

    nil # should not reach here
  end

  def failure_message
    padding = ' ' * if @error.message =~ /expected not/ then 4 else 0 end

    ["    line: #{failure_line}",
     "  item #{@counter}: #{object_description}"
    ].map { |line| padding + line }.push(@error.message).join("\n")
  end

  # no need for should_not, so no negative_failure_messages
end

def each(options=nil, &block)
  MatchEach.new options, &block
end
