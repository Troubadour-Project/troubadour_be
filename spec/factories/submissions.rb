FactoryBot.define do
  factory :submission do
    name { Faker::Music.band }
    email { Faker::Internet.email }
    genre { Faker::Music.genre }
    song_title { Faker::Music::RockBand.song }
    winner { false }
    profile { Rack::Test::UploadedFile.new('spec/fixtures/blank_profile_photo.jpeg', 'image/jpeg') }
    video { Rack::Test::UploadedFile.new('spec/fixtures/pexels_stock_video.mp4', 'image/mp4') }
  end
end
