# features/step_definitions/exemplo_steps.rb
require 'httparty'

Given('que eu faço uma requisição GET para {string}') do |url|
  @response = HTTParty.get(url)
end

Then('o status code deve ser {int}') do |status_code|
  expect(@response.code).to eq(status_code)
  puts @response
end