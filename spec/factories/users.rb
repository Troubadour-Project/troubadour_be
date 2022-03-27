FactoryBot.define do
  factory :user do
    name { Faker::Name.name}
    email { Faker::Internet.email }
    selected { nil }
    user_type { 1 }
    song_title { Faker::Lorem.word }
    genre { Faker::Lorem.word }
  end
end
