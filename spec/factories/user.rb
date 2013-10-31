FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    birthdate "1990-01-01"
    cohort_id 1
    interest "Skiing"
  end
end
