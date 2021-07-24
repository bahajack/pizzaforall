require 'faker'
FactoryBot.define do

  factory :order do |f|
    f.product_name { Faker::Lorem.word }
    f.product_count { Faker::Number.number(digits: 3).to_i }
    association :customer
  end
end
