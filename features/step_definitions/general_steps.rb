Quando('que eu faça uma requisição ao {string}') do |endpoint|
  @endpoint = endpoint
  @response = HTTParty.get(APIConfig.full_url(@endpoint))

  # Verifique se o conteúdo da resposta é JSON
  if @response.headers['content-type'].include?('application/json')
    @response_body = JSON.parse(@response.body)
  else
    raise "Erro: Esperado JSON, mas recebeu HTML ou outro tipo de conteúdo. Conteúdo retornado: #{@response.body}"
  end
end
