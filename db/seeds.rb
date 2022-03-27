# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |u|
  User.create(name: "User #{u+1}", email: Faker::Internet.email, song_title: Faker::Lorem.word, genre: Faker::Lorem.word, selected: nil, user_type: 1)
end
