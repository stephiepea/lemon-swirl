task :console => :environment do
	begin
		require 'irb'
		ARGV.clear
		IRB.start
	rescue
	end
end
