module Ensemble
	module Helpers

		class StylesheetsManager < AssetManager

			private

			def format file
				"\n<link rel='stylesheet' href='#{path_to file}' type='text/css' media='screen' charset='utf-8'>"
			end

			def format_as_internal file
				"/stylesheets/#{file}.css"
			end

		end
	end
end

module Sinatra
	module Helpers

		def stylesheets
			@stylesheets ||= Ensemble::Helpers::StylesheetsManager.new('stylesheets')
		end

	end
end
