# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec_multi_matchers}
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Greg Weber"]
  s.date = %q{2008-12-09}
  s.description = %q{* match_each * match_enum * match_in_order  require 'rubygems' require 'spec' require 'gregwebs-rspec_multi_matchers'  describe 'array of ones' do it 'should be all ones' do [1,2,3].should each { |n|  n.should == 1 } end end  =begin output 'array of ones should fail on 2' FAILED line: 14 item 1: 2 expected: 1, got: 2 (using ==) =end  As expected, the output shows expected and got fields line is the line number of the expectiation inside the block the item line gives the index of the item being yielded to the block, and the item itself}
  s.email = [""]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/match_each.rb", "lib/match_enum.rb", "lib/match_in_order.rb", "lib/rspec_multi_matchers.rb", "script/console", "script/destroy", "script/generate", "spec/match_each_spec.rb", "spec/match_enum_spec.rb", "spec/match_in_order_spec.rb", "spec/shared_enum_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "tasks/rspec.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/gregwebs/rspec-multi-matchers}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rspec_multi_matchers}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{* match_each * match_enum * match_in_order  require 'rubygems' require 'spec' require 'gregwebs-rspec_multi_matchers'  describe 'array of ones' do it 'should be all ones' do [1,2,3].should each { |n|  n.should == 1 } end end  =begin output 'array of ones should fail on 2' FAILED line: 14 item 1: 2 expected: 1, got: 2 (using ==) =end  As expected, the output shows expected and got fields line is the line number of the expectiation inside the block the item line gives the index of the item being yielded to the block, and the item itself}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.1.0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    end
  end
end
