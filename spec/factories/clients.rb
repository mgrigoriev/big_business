# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    title { Faker::Company.unique.name }
    name  { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
  end
end

# == Schema Information
#
# Table name: clients
#
#  id         :bigint(8)        not null, primary key
#  slug       :string
#  title      :string
#  name       :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_clients_on_slug  (slug) UNIQUE
#
