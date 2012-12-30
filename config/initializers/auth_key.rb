# Must initialize the constant to load Rails
API_KEY = '' 

config = "#{Rails.root}/config/auth_key.yml"

if File.exists?(config)
  API_KEY = YAML.load_file(config)[Rails.env]['api_key']
else
  API_KEY = ENV['API_KEY']
end