def each meta_or_options = nil, &block
  if block or !meta_or_options
    MatchEach.new meta_or_options, &block
  else
    each_matcher meta_or_options
  end
end

RSpec::Matchers.define :each_matcher do |meta|
  match do |actual|
    actual.each_with_index do |i, j|
      @elem = j
      i.should meta_or_options
    end
  end

  failure_message_for_should do |actual|
    "at[#{@elem}] #{meta_or_options.failure_message_for_should}"
  end
end

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
    error_lines = []
    @error.backtrace.each do |line|
      if line[/:\d+:in\s*[`'"](.*)[`'"]\s*$/, 1] == 'matches?'
        error_lines.reverse_each do |line|
          return line[/^[^:]+:(\d+)/, 1] if line !~ %r!rspec-multi-matchers/lib/match_each\.rb!
        end
      end
      error_lines.push line
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
