FactoryBot.define do
  factory :comment do
    sequence(:body) { |n| "comment-#{n}" }
    entry
  end
end
