working_dir = File.expand_path( File.dirname(__FILE__) )
lib_dir = "#{working_dir}/../lib"

Dir[ File.join(lib_dir, '*.rb') ].each {|f| require f}
Dir[ File.join(working_dir, '/*spec.rb') ].each {|f| require f}
