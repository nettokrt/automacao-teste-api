require 'faker'

class UserFactory
  def self.build
    {
      name: Faker::Name.name,
      email: Faker::Internet.email,
      username: Faker::Internet.username,
      address: {
        street: Faker::Address.street_name,
        city: Faker::Address.city,
        zipcode: Faker::Address.zip_code
      },
      phone: Faker::PhoneNumber.phone_number,
      website: Faker::Internet.domain_name,
      company: {
        name: Faker::Company.name,
        catchPhrase: Faker::Quote.famous_last_words,
        bs: Faker::Movie.quote
    },
  }
  end
end