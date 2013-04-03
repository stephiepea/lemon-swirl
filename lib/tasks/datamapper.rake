namespace :db do
	
	desc 'seed the database'
	task :seed => :environment do
		require File.expand_path('../../../db/seed', __FILE__)
		Database.seed
	end
	
	namespace :auto do
		desc 'auto migrate database, will wipe existing data'
		task :migrate => :environment do
			DataMapper.finalize.auto_migrate!
		end
		
		desc 'auto upgrade database, will not wipe existing data'
		task :upgrade => :environment do
			DataMapper.finalize.auto_upgrade!
		end
	end
	
end