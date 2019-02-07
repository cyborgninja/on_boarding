# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "product#{n}" }
  end
end
