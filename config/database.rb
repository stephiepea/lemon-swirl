module Database
	
	class Client
			
		def self.init
			unless setup
				return false
			end
			
			Dir.glob(File.expand_path('../../app/models/**', __FILE__), &method(:require))
			#
			#if ENV['DB_AUTOMIGRATE']
			#	DataMapper.finalize.auto_migrate!
			#elsif ENV['DB_AUTOUPGRADE']
			#	DataMapper.finalize.auto_upgrade!
			#else
			#	DataMapper.finalize
			#end
		end
		
		def self.setup
			#case ENV['DB_ADAPTER']
			#when 'sqlite'
			#	DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/#{ENV['DB_LOCATION']}")
			#when 'postgres'
			#	DataMapper.setup(:default, "postgres://#{ENV['DB_LOCATION']}")
			#when 'mysql'
			#	DataMapper.setup(:default, "mysql://#{ENV['DB_LOCATION']}")
			#when 'mongodb'
			#	DataMapper.setup(:default, "mongo://#{ENV['DB_LOCATION']}")
			#else
			#	false
			#end
		end
		
	end
	
end
Database::Client.init