require 'yaml'

class CustomConfig

  VERSION = '0.4.5'
  # Config hash
  # * api_key
  # * server_url

  def initialize 
    if File.exists?(ENV['HOME']+'/.sheep_config.yml')
      sheep_config = YAML.load_file(ENV['HOME']+'/.sheep_config.yml')
      foo = sheep_config if sheep_config

      (class << self; self; end).class_eval do
        foo.each_pair do |key, value|
          define_method key.to_sym do
            value
          end
        end
      end

    else
      throw "No config file found in #{ENV['HOME']}"
    end
  end

end
