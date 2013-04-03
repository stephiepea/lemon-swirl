module Ensemble
	module Helpers
		class AssetManager

			def initialize(config_file = nil)
				assets << get_assets_from_config(config_file)
			end

			def assets
				@assets ||= []
			end

			def add *files
				assets << files
			end

			def render *files
				(@assets << files).flatten.uniq.map { |file| format file }.join
			end

			private

			def path_to file
				if is_external? file
					format_as_external file
				else
					format_as_internal file
				end
			end

			def is_external? file
				file =~ %r{^external/}
			end

			def format_as_internal file
				file
			end

			def format_as_external file
				file.sub(%r{external/},'')
			end

			def format file
				"#{file}"
			end

			def load_config path
				(path && YAML.load_file(File.expand_path("../../../config/#{path}.yml", __FILE__))) || []
			end

			def get_assets_from_config path
				load_config(path).map{ |dir,files| files.map {|file| "#{dir}/#{file}"}}.flatten
			end

		end
	end
end

