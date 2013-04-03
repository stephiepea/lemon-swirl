namespace :log do
	
	task :clear do
		Dir.glob(File.expand_path('../../../log/**/*.log', __FILE__)).each do |file|
			File.delete(file)
		end
	end
	
end