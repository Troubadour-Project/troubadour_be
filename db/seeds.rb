# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include ActionDispatch::TestProcess::FixtureFile

admin = Admin.create(username: 'admin1', email: Faker::Internet.email)

# photo = fixture_file_upload('blank_profile_photo.jpeg', 'image/jpeg')
# vid = fixture_file_upload('pexels_stock_video.mp4', 'video/mp4')

# 5.times do |u|
#   submission = Submission.new(
#                           name: "sub#{u+1}", 
#                           email: Faker::Internet.email, 
#                           song_title: Faker::Lorem.word, 
#                           genre: Faker::Lorem.word, 
#                           winner: nil,
#                          )
#   submission.profile.attach(
#     io: File.open(Rails.root.join('spec/fixtures/blank_profile_photo.jpeg')), 
#     filename: 'blank_profile_photo.jpeg', 
#     content_type: 'image/jpeg'
#   )
#   submission.video.attach(
#     io: File.open(Rails.root.join('spec/fixtures/pexels_stock_video.mp4')), 
#     filename: 'pexels_stock_video.mp4', 
#     content_type: 'video/mp4'
#   )
#   submission.save!
#   SubmissionAdmin.create(admin_id: admin.id, submission_id: submission.id)
# end
