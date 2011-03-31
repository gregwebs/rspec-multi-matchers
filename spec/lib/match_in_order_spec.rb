require File.dirname(__FILE__) + '/../spec_helper'

describe MatchInOrder do

  it "should match a single regular expression" do
    "a".should match_in_order(//)
    "a".should match_in_order(/a/)
    "a".should_not match_in_order(/b/)
    "z".should_not match_in_order(/a/)
  end

  it "should not match the same regular expressions twice" do
    "a".should_not match_in_order(/a/,/a/)
    lambda{ "a".should match_in_order(/a/,/a/) }.should raise_error(Rspec::Expectations::ExpectationNotMetError, 'expected "" to match /a/' << "\n" << 'within string: "a"')

    "abc".should_not match_in_order(/a/,/b/,/c/,/a/)
    lambda{ "abc".should match_in_order(/a/,/b/,/c/,/a/) }.should raise_error(Rspec::Expectations::ExpectationNotMetError, 'expected "" to match /a/' << "\n" << 'within string: "abc"') 
  end

  it "should match multiple regular expressions in order" do
    "abc".should match_in_order(/a/,/b/,/c/)
    lambda{ "abc".should_not match_in_order(/a/,/b/,/c/) }.should raise_error(Rspec::Expectations::ExpectationNotMetError,'expected "abc" to not match in order against: [/a/, /b/, /c/]') 

    "abc".should_not match_in_order(/a/,/c/,/b/)
    lambda{ "abc".should match_in_order(/a/,/c/,/b/) }.should raise_error(Rspec::Expectations::ExpectationNotMetError,'expected "" to match /b/' << "\n" << 'within string: "abc"')

    "abc".should_not match_in_order(/b/,/a/,/c/)
    lambda{ "abc".should match_in_order(/b/,/a/,/c/) }.should raise_error(Rspec::Expectations::ExpectationNotMetError,'expected "c" to match /a/' << "\n" << 'within string: "abc"')
  end
end
