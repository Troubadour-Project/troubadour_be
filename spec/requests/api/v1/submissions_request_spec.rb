require 'rails_helper'

RSpec.describe 'Submissions Request' do
  describe 'request to create a submission' do
    describe 'POST /submissions' do
      context 'sucessful request' do
        it 'renders the JSON creation of the submission object and created status' do
          sub_params = ({
                      name: 'Sierra',
                      email: 'test@email.com',
                      song_title: 'Software Jam',
                      genre: 'Bluegrass?',
                      profile: fixture_file_upload('users_profile_submission.JPG', 'image/jpg'),
                      video: fixture_file_upload('users_video_submission.mp4', 'video/mp4'),
                      winner: false
          })
          headers= {"CONTENT_TYPE" => "multipart/form-data"}

          post "/api/v1/submissions", headers: headers, params: {submission: sub_params}

          created_submission = Submission.last
          expect(response.status).to eq(201)
          expect(created_submission.name).to eq(sub_params[:name])
          expect(created_submission.email).to eq(sub_params[:email])
          expect(created_submission.genre).to eq(sub_params[:genre])
          expect(created_submission.song_title).to eq(sub_params[:song_title])
          expect(created_submission.profile.name).to eq('profile')
          expect(created_submission.video.name).to eq('video')
          expect(created_submission.winner).to eq(sub_params[:winner])
        end

        it 'creates a submission admin joins connection for every admin' do
          admin_list = create_list(:admin, 5)

          sub_params = ({
            name: 'Sierra',
            email: 'test@email.com',
            song_title: 'Software Jam',
            genre: 'Bluegrass?',
            profile: fixture_file_upload('users_profile_submission.JPG', 'image/jpg'),
            video: fixture_file_upload('users_video_submission.mp4', 'video/mp4'),
            winner: false
            })
          headers= {"CONTENT_TYPE" => "multipart/form-data"}

          post "/api/v1/submissions", headers: headers, params: {submission: sub_params}
          new_sub = Submission.last

          expect(new_sub.submission_admins.count).to eq(5)
          expect(new_sub.submission_admins.first).to be_a(SubmissionAdmin)

          expect(admin_list[0].submission_admins.count).to eq(1)
          expect(admin_list[0].submission_admins.first).to be_a(SubmissionAdmin)
        end
      end

      context 'unsuccessful request' do
        it 'renders the JSON error status when given incorrect params' do
          sub_params = ({
            name: 'Sierra',
            email: 'test@email.com',
            song_title: 'Software Jam',
            profile: fixture_file_upload('users_profile_submission.JPG', 'image/jpg'),
            video: fixture_file_upload('users_video_submission.mp4', 'video/mp4'),
            winner: false
            })
          headers= {"CONTENT_TYPE" => "multipart/form-data"}
          post "/api/v1/submissions", headers: headers, params: {submission: sub_params}
          json = json_parse(response.body)

          expect(json[:errors]).to eq("Validation failed: Genre can't be blank")
          expect(response.status).to eq(400)
        end
      end
    end
  end
end
