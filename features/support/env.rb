# features/support/env.rb
require 'httparty'
require 'yaml'
require_relative 'api_config'

# Carregar o arquivo YAML
CONFIG = YAML.load_file('config/apis.yml')

# Definir o ambiente (pode ser mudado para 'production' conforme necessário)
ENVIRONMENT = 'development'