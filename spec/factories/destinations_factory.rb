FactoryBot.define do
  factory :destination do
    name { Faker::Beer.style }
  end
end