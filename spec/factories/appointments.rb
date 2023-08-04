FactoryBot.define do
  factory :appointment do
    date { Date.today } # Replace this with your desired date logic
    slote_time { "09:00 AM" } # Replace this with your desired time logic
    pickup_location { Faker::Address.full_address }
    full_name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.phone_number }
    cab_service { [true, false].sample }
    association :user, factory: :user
  end
end
