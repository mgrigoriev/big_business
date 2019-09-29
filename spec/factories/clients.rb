# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    title { Faker::Company.unique.name }
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
  end
end
