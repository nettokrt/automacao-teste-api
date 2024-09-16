module Commons
  module DataLoader
    def load_data_by(entity, profile)
      data = YAML.load_file("features/support/factory/static/#{ENVIRONMENT}.yml")
      return unless data[entity]
      
      data[entity].find { |entry| entry['profile'] == profile }
    end
  end
end