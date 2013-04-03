desc 'setup the project'
task :setup do
	puts 'Setting Up Project . . .'
	puts 'Installing Bundle'
	puts `bundle install`
	puts 'Creating Directories'
	puts `mkdir log`
	puts `mkdir tmp`
	puts 'Setup Complete'
end
