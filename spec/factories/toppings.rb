FactoryBot.define do
  factory :topping do
    topping_name { Faker::Name.name }
    topping_price { Faker::Number.number(digits: 3).to_i }
    association :menu
  end
end
