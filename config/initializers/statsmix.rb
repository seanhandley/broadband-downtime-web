# Must initialize the constant to load Rails
STATSMIX_API_KEY = '' 

statsmix_config = "#{Rails.root}/config/statsmix.yml"

if File.exists?(statsmix_config)
  STATSMIX_API_KEY = YAML.load_file(statsmix_config)[Rails.env]['api_key']
else
  STATSMIX_API_KEY = ENV['STATSMIX_API_KEY']
end

require "statsmix"
StatsMix.api_key = STATSMIX_API_KEY