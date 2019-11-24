# frozen_string_literal: true

class Order < ApplicationRecord
  monetize :price_cents
  monetize :cost_cents
  monetize :payed_amount_cents

  enum status: { pending: 'pending', in_progress: 'in_progress', done: 'done' }

  validates :title, presence: true

  belongs_to :client
end

# == Schema Information
#
# Table name: orders
#
#  id                    :bigint(8)        not null, primary key
#  client_id             :bigint(8)        not null
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
