namespace :restart do
	task :once do
		puts `touch tmp/restart.txt`
	end

	desc 'restart the application with every request'
	task :always do
		puts `touch tmp/always_restart.txt`
	end

	desc 'stop restarting the application with every request'
	task :stop do
		puts `rm -f tmp/always_restart.txt`
	end
end

desc 'restart the application'
task :restart => 'restart:once'
