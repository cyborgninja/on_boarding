FactoryBot.define do
  factory :blog do
    sequence(:title) { |n| "blog-#{n}" }
    user

  end
end