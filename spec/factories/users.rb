# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "rspec_user#{n}" }
    sequence(:email) { |n| "rspec_user#{n}@test.com" }
    # age 20
    # password 'hogehoge'
    # role 'admin'
  end
end
