FactoryBot.define do
  factory :travel_time do
    user
    start_point { Faker::Address.city }
    end_point { Faker::Address.city }
    duration { Faker::Number.number(digits: 2) }
    distance { Faker::Number.number(digits: 2) }
  end
end
