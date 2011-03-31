class MatchEnum
  @@enum_methods = [] # avoid re-defining

  class MatchEnumError < Exception; end
  class BlankEnumerableError < MatchEnumError; end
  class NoBlockGivenError < MatchEnumError; end

  def initialize(method, *enum_args, &block)
    options = enum_args.pop if Hash === enum_args.last
    @method = method
    @enum_args = enum_args
    @empty_okay = (options and options[:empty])
    @block = block
    if !@block
      raise NoBlockGivenError, 'no block given, you probably need to use brackets instead of "do...end"'
    end

    @num_block_args = @block.arity
    @num_block_args = 0 if @num_block_args == -1 # correct ruby error
    if enum_args.empty?
      return if @@enum_methods[@num_block_args]
      @@enum_methods[@num_block_args] = true
    end

    args = (1..(@num_block_args)).map {|i| 'arg_' << i.to_s}.join(',')
    invoke_enum = if @enum_args.empty?
      "target.send(@method) do |#{args}|"
                  else
      "target.send(@method, *@enum_args) do |#{args}|"
                  end
    eval <<-EOS
    def enum_#{@num_block_args}(target)
      @counter = 0
      #{invoke_enum}
        begin
          @block.call(#{args})
        rescue Spec::Expectations::ExpectationNotMetError => e
          @error_msg = e.to_s
          @failure_object = [#{args}]
          return false
        end
        @counter += 1
      end
      true
    end
    EOS
  end

  def enum(target)
    eval("enum_#{@num_block_args}(target)")
  end

  def matches?(target)
    if target.nil?
      raise BlankEnumerableError, "Expected an enumerable object, but got nil"
    end

    if !@empty_okay && target.empty?
      raise BlankEnumerableError, "No items in the given enumerator.\nTo allow an empty enumerator pass the :empty option with a true value"
    end

    return enum(target)
  end

  def failure_message
    if @error_msg =~ /expected not/ then '    ' else '' end <<
      "  item #{@counter}: #{@failure_object.inspect}\n#{@error_msg}"
  end

  # no need for should_not, so no negative_failure_messages
end

def enum(method, *args, &block)
  MatchEnum.new method, *args, &block
end
