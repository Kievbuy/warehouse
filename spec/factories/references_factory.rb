FactoryBot.define do
  factory :reference do
    name { Faker::Beer.name }
  end
end