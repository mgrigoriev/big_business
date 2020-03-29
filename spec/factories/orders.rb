# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    client
    title { Faker::Commerce.unique.product_name }
    sequence(:invoice_number) { |i| i + 100 }
    invoice_date { Date.current }
    price_cents { Faker::Number.within(range: 500_000..900_000) }
    cost_cents { Faker::Number.within(range: 100_000..500_000) }
    payed_amount_cents { 0 }
  end
end

# == Schema Information
#
# Table name: orders
#
#  id                    :bigint(8)        not null, primary key
#  client_id             :bigint(8)        not null
#  slug                  :string
#  title                 :string
#  status                :enum             default("pending"), not null
#  invoice_number        :integer(4)
#  invoice_date          :date
#  price_cents           :integer(4)       default(0), not null
#  price_currency        :string           default("USD"), not null
#  cost_cents            :integer(4)       default(0), not null
#  cost_currency         :string           default("USD"), not null
#  payed_amount_cents    :integer(4)       default(0), not null
#  payed_amount_currency :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_orders_on_client_id  (client_id)
#  index_orders_on_status     (status)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#
