# features/support/api_config.rb

module APIConfig
  CONFIG = YAML.load_file('config/apis.yml')
  ENVIRONMENT = 'development'

  def self.base_url
    CONFIG[ENVIRONMENT]['api_base_url']
  end

  def self.full_url(endpoint)
    "#{base_url}#{endpoint}"
  end
end