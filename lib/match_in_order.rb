class MatchInOrder
  def initialize(regexps)
    @regexps = regexps
  end

  def matches?(target)
    @target = target
    @regexps.inject(target) do |str, regexp|
      m = str.match(regexp)
      if m.nil?
        @failure_string = str
        @failure_regex = regexp
        return false
      end
      m.post_match
    end
    true
  end

  def failure_message
    "expected #{@failure_string.inspect} to match #{@failure_regex.inspect}\nwithin string: #{@target.inspect}"
  end

  def negative_failure_message
    "expected #{@target.inspect} to not match in order against: #{@regexps.inspect}"
  end
end

def match_in_order(*regexps)
  MatchInOrder.new(regexps)
end
