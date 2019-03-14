# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "rspec_user#{n}" }
    sequence(:email) { |n| "rspec_user#{n}@test.com" }

    factory :admin_user do
      sequence(:email) { |n| "admin_user#{n}@test.com" }
      confirmation_sent_at { Time.current }
      after(:build) do |user|
        user.confirm
        user.role = "admin"
      end
    end
  end
end
