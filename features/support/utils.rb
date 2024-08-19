module Utils
  def self.validate_type(data, key, type)
    unless data.is_a?(Hash) && data.key?(key) && data[key].is_a?(type)
      raise "Tipo inválido para '#{key}': esperado #{type}, encontrado #{data[key].class}"
    end
  end

  def self.verify_status_code(response, expected_code)
    raise "Status esperado: #{expected_code}, Status obtido: #{response.code}" unless response.code.to_i == expected_code
  end

  def self.validate_email(email)
    unless email.match(/\A[^@\s]+@[^@\s]+\z/)
      raise "Formato de e-mail inválido: #{email}"
    end
  end

  def self.validate_zipcode(zipcode)
    unless zipcode.match(/^\d{5}-\d{4}$/)
      raise "Formato de CEP inválido: #{zipcode}"
    end
  end

  def self.validate_geo_coordinates(coordinate)
    unless coordinate.match(/^(-?\d+(\.\d+)?)$/)
      raise "Formato de coordenada geográfica inválido: #{coordinate}"
    end
  end

  def self.validate_phone(phone)
    unless phone.match(/^\d{1,4}-\d{3}-\d{3}-\d{4}( x\d+)?$/)
      raise "Formato de telefone inválido: #{phone}"
    end
  end

  def self.validate_website(website)
    unless website.match(/\A[^\s]+\z/)
      raise "Formato de website inválido: #{website}"
    end
  end
end