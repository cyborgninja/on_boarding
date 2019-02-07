FactoryBot.define do
  factory :entry do
    sequence(:title) { |n| "entry-#{n}" }
    # body 'test'
    blog
  end
end
