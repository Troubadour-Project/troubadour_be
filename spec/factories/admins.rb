FactoryBot.define do
  factory :admin do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
  end
end
