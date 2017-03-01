FactoryGirl.define do
  factory :user do
    api_token { SecureRandom.uuid }
    username { Faker::Internet.user_name }
    email { Faker::Internet.safe_email }
    password { Faker::Internet.password }

    trait :with_notes do
      after(:create) do |user|
        create_list :note_with_tags, 5, user: user
      end
    end
  end
end
