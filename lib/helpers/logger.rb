###
# monkey patches Sinatra's logger
# logger.debug						"trying to connect to mongodb"
# logger[:database].fatal	"can't connect to mongodb @ 10.10.10.52"
#

module Ensemble
	module Helpers

		class Logger
			def logger(type = :application)
				unless custom_logger = Log4r::Logger[type.to_s]
					custom_logger = Log4r::Logger.new type.to_s
					custom_logger.add Log4r::FileOutputter.new(type.to_s, {
						:filename => "log/#{ENV['RACK_ENV']}_#{type}.log",
					})
					custom_logger.level = Log4r.const_get(ENV['LOGGER_LEVEL'])
				end
				return custom_logger
			end
		end

	end
end

module Sinatra
	module Helpers

		def logger(type = :application)
			(@logger ||= Ensemble::Helpers::Logger.new).logger(type)
		end

	end
end
