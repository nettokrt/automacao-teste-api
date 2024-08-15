Quando('que eu faço uma requisição GET') do 
  users_endpoint = '/users'
  @response = HTTParty.get(APIConfig.full_url(users_endpoint))
end

Entao('o status code deve ser {int}') do |status_code|
  expect(@response.code).to eq(status_code)
  puts @response
end