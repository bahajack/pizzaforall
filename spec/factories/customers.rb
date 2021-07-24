require 'faker'
FactoryBot.define do
  factory :customer do |f|
    f.name { Faker::Name.name }
    f.address { Faker::Address.street_address }
    f.phone { Faker::Number.number(digits: 10) }

  end
end
