require 'lib/rspec_multi_matchers'
Gem::Specification.new do |s|
  s.name = 'rspec_multi_matchers'
  s.version = RspecMultiMatchers::VERSION
  s.authors = ['Greg Weber']
  s.summary = s.description = "better collection testing"
  s.files   = Dir.glob("lib/**/*") + %w(README.rdoc)
  s.test_files   = Dir.glob("spec/**/*")
end
