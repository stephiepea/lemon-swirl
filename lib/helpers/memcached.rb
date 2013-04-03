###
# helper method for memcached access
# memcached.set		'my_key', 'my_value'
# memcached.get		'my_key'							# returns 'my_value'
#
# if a memcached server doesn't exist / isn't found emulates Dalli's functionality with empty methods
#

module Ensemble
	module Helpers

		class Memcached

			def set (key, value)
				client.set(key, value)
			end

			def get (key)
				client.get(key)
			end

			def delete (key)
				client.delete(key)
			end

			def client
				return @client if @client
				begin
					@client = Dalli::Client.new ENV['MEMCACHED_LOCATION']
					@client.get 'test_key'
					@client
				rescue
					@client = NilMemcached.new
				end
			end

		end

		class NilMemcached
			def set (key, value)
				nil
			end

			def get (key)
				nil
			end

			def delete (key)
				nil
			end
		end

	end
end

module Sinatra
	module Helpers

		def memcached
			@memcached_client ||= Ensemble::Helpers::Memcached.new
		end

	end
end
