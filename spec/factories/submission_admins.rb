FactoryBot.define do
  factory :submission_admin do
    favorite { false }
    admin
    submission
  end
end
