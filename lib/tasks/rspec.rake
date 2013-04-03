begin

Rake::Task['environment'].execute
require 'rspec/core/rake_task'
namespace :spec do

	RSpec::Core::RakeTask.new(:all) do |test|
	 	test.pattern = "./spec/**/*_spec.rb"
	end

	desc 'run helpers specifications'
	RSpec::Core::RakeTask.new(:helpers) do |test|
		test.pattern = "./spec/**/helpers/*_spec.rb"
	end

	desc 'run models specifications'
	RSpec::Core::RakeTask.new(:models) do |test|
		test.pattern = "./spec/**/models/*_spec.rb"
	end
	
	desc 'run app specifications'
	RSpec::Core::RakeTask.new(:app) do |test|
		test.pattern = "./spec/**/app/*_spec.rb"
	end
	
end
desc 'run all the specifications'
task :spec => 'spec:all'

rescue LoadError
end
