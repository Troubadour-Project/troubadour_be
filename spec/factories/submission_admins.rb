FactoryBot.define do
  factory :submission_admin do
    selected { false }
    admin { nil }
    submission { nil }
  end
end
