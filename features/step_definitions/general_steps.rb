Quando('eu faço uma requisição ao {string}') do |endpoint|
  @response = HTTParty.get(APIConfig.full_url(endpoint))
end

Entao('o status code deve ser {int}') do |status_code|
  expect(@response.code).to eq(status_code)
end