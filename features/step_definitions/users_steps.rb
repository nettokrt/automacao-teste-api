  Dado('que um novo usuário é gerado') do
    @novo_usuario = UserFactory.build
  end

  Quando('eu enviar uma requisição POST para {string}') do |endpoint|
    @response = HTTParty.post(
      APIConfig.full_url(endpoint),
      body: @novo_usuario.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  Então('a resposta deve retornar o status code {int}') do |status_code|
    Utils.verify_status_code(@response, status_code)
  end

  Então('o corpo da resposta deve conter os dados corretos do usuário') do
    response_body = JSON.parse(@response.body)
    begin
      Utils.comparar_dados(@novo_usuario, response_body)
    rescue RuntimeError => e
      expect { raise e.message }.to_not raise_error, e.message
    end
  end
  
  Então('validar a resposta da API com dados mockados') do
    response_body = JSON.parse(@response.body)
    Utils.verify_status_code(@response, 200)
  
    if @endpoint == "/users"
      expect(@response.body).not_to be_nil
    else
      dados_yaml = YAML.load_file('features/support/factory/static/development.yml')
      usuario_esperado = dados_yaml.dig('users', 'user1')
      campos = dados_yaml['campos_principais']

      campos.each do |campo|
        resultValue = usuario_esperado.dig(*campo.split('.'))
        bodyValue = response_body.dig(*campo.split('.'))
        
        expect(bodyValue).to eq(resultValue), "Falha no campo: #{campo}. Esperado: #{resultValue}, Obtido: #{bodyValue}"
      end
    end
  end
  
  Então('a resposta deve seguir as regras de contrato') do 
    response_body = JSON.parse(@response.body)
  
    # Verificação do código de status
    Utils.verify_status_code(@response, 200)
    
    # Validação dos campos principais
    expect { Utils.validate_type(response_body, 'name', String) }.not_to raise_error
    expect { Utils.validate_type(response_body, 'id', Integer) }.not_to raise_error
    expect { Utils.validate_type(response_body, 'username', String) }.not_to raise_error
    expect { Utils.validate_email(response_body['email']) }.not_to raise_error
    
    # Validação dos campos de endereço
    address = response_body['address']
    expect { Utils.validate_type(address, 'street', String) }.not_to raise_error
    expect { Utils.validate_type(address, 'suite', String) }.not_to raise_error
    expect { Utils.validate_type(address, 'city', String) }.not_to raise_error
    expect { Utils.validate_zipcode(address['zipcode']) }.not_to raise_error
    
    # Validação dos campos de geo
    geo = address['geo']
    expect { Utils.validate_geo_coordinates(geo['lat']) }.not_to raise_error
    expect { Utils.validate_geo_coordinates(geo['lng']) }.not_to raise_error
    
    # Validação dos campos de contato
    expect { Utils.validate_phone(response_body['phone']) }.not_to raise_error
    expect { Utils.validate_website(response_body['website']) }.not_to raise_error
    
    # Validação da empresa
    company = response_body['company']
    expect { Utils.validate_type(company, 'name', String) }.not_to raise_error
    expect { Utils.validate_type(company, 'catchPhrase', String) }.not_to raise_error
    expect { Utils.validate_type(company, 'bs', String) }.not_to raise_error
  end

  Então('a mensagem de erro deve ser {string}') do |mensagem_erro|
    puts @response.body
    expect(@response.message).to eq(mensagem_erro)
  end