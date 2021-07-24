FactoryBot.define do
  factory :store do
    store_name { Faker::Name.name }
    store_address { Faker::Address.street_address }
    order_type { Faker::Order.delivery }

    association :menu
  end
end
