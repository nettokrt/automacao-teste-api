  Dado('que eu tenha os dados do novo usuário') do
    @novo_usuario = UserFactory.build
  end

  Quando('eu enviar uma requisição POST para {string}') do |endpoint|
    @response = HTTParty.post(
      APIConfig.full_url(endpoint),
      body: @novo_usuario.to_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end

  Então('a resposta deve ter status {int}') do |int|
    Utils.verify_status_code(@response, 201)
  end

  Então('o corpo da resposta deve conter os dados corretos do usuário') do
    response_body = JSON.parse(@response.body)
    begin
      Utils.comparar_dados(@novo_usuario, response_body)
    rescue RuntimeError => e
      expect { raise e.message }.to_not raise_error, e.message
    end
  end