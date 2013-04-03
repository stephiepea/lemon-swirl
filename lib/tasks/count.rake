namespace :count do

	def count_words(folders = ['app', 'lib', 'vendor'], types)
		puts `find #{format_folders(folders)} -type f #{format_types(types)} | xargs wc -l | sort`
	end

	def format_folders(folders)
		folders.join(' ')
	end

	def format_types(types)
		"\\( #{types.map{|i| "-name '*.#{i}'"}.join(' -o ')} \\)"
	end

	task :all do
		folders	= ['app','config','lib','vendor','spec']
		types		= ['rb', 'coffee', 'yaml']
		count_words(folders, types)
	end

	desc "count rb, coffee in app"
	task :app do
		folders	= ['app']
		types		= ['rb', 'coffee']
		count_words(folders, types)
	end

	desc "count rb, yaml in config"
	task :config do
		folders = ['config']
		types		= ['rb', 'yaml']
		count_words(folders, types)
	end

	desc "count rb, coffee in lib"
	task :lib do
		folders	= ['lib']
		types		= ['rb', 'coffee']
		count_words(folders, types)
	end

	desc "count rb, coffee in vendor"
	task :vendor do
		folders	= ['vendor']
		types		= ['rb', 'coffee']
		count_words(folders, types)
	end

	desc "count rb, coffee in spec"
	task :spec do
		folders	= ['spec']
		types		= ['rb', 'coffee']
		count_words(folders, types)
	end

end

desc "count rb, coffee, yaml in app, config, lib, vendor, spec"
task :count => 'count:all'
