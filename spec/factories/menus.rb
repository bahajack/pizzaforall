FactoryBot.define do
  factory :menu do
    menu_name { Faker::Name.name }
    menu_type { Faker::Name.name }
    size { Faker::Name.name }
    price { Faker::Number.number(digits: 3).to_i }
    association :order
  end
end
