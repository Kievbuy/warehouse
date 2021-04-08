FactoryBot.define do
  factory :product do
    name { Faker::Coffee.blend_name }
    category
    reference
    destination
    price { Faker::Number.between(from: 100, to: 10000) }
  end
end