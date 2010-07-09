%w[rubygems rake rake/clean fileutils newgem rubigen hoe].each { |f| require f }
require File.dirname(__FILE__) + '/lib/rspec_multi_matchers'

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.new('rspec_multi_matchers', RspecMultiMatchers::VERSION) do |p|
  p.developer('Greg Weber', '')
  p.summary = "better collection testing"
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  # p.extra_deps         = [
  #   ['activesupport','>= 2.0.2'],
  # ]
  p.extra_dev_deps = [
    ['newgem', ">= #{::Newgem::VERSION}"]
  ]
  
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
  #path = (p.rubyforge_name == p.name) ? p.rubyforge_name : "\#{p.rubyforge_name}/\#{p.name}"
  #p.remote_rdoc_dir = File.join(path.gsub(/^#{p.rubyforge_name}\/?/,''), 'rdoc')
  #p.rsync_args = '-av --delete --ignore-errors'
end

require 'newgem/tasks' # load /tasks/*.rake
Dir['tasks/**/*.rake'].each { |t| load t }

remove_task :default
task :default => [:spec]
