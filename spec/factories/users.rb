FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
  end
end
