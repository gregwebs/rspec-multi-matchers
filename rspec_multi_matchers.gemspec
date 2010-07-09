--- !ruby/object:Gem::Specification 
name: rspec_multi_matchers
version: !ruby/object:Gem::Version 
  version: 1.0.6
platform: ruby
authors: 
- Greg Weber
autorequire: 
bindir: bin
cert_chain: []

date: 2010-07-08 00:00:00 -07:00
default_executable: 
dependencies: 
- !ruby/object:Gem::Dependency 
  name: newgem
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 1.5.2
    version: 
- !ruby/object:Gem::Dependency 
  name: hoe
  type: :development
  version_requirement: 
  version_requirements: !ruby/object:Gem::Requirement 
    requirements: 
    - - ">="
      - !ruby/object:Gem::Version 
        version: 2.3.3
    version: 
description: ""
email: 
- ""
executables: []

extensions: []

extra_rdoc_files: 
- History.txt
- Manifest.txt
files: 
- History.txt
- Manifest.txt
- README.rdoc
- Rakefile
- lib/match_each.rb
- lib/match_enum.rb
- lib/match_in_order.rb
- lib/rspec_multi_matchers.rb
- script/console
- script/destroy
- script/generate
- spec/match_each_spec.rb
- spec/match_enum_spec.rb
- spec/match_in_order_spec.rb
- spec/shared_enum_spec.rb
- spec/spec.opts
- spec/spec_helper.rb
- tasks/rspec.rake
has_rdoc: true
homepage: 
licenses: []

post_install_message: 
rdoc_options: 
- --main
- README.txt
require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: rspec_multi_matchers
rubygems_version: 1.3.5
signing_key: 
specification_version: 3
summary: better collection testing
test_files: []


