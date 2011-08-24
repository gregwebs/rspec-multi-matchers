require 'rspec'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module RspecMultiMatchers
  VERSION = '1.2.0'
end

require "match_each"
require "match_enum"
require "match_in_order"
