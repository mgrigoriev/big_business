# frozen_string_literal: true

class Client < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true

  has_many :orders, dependent: :restrict_with_error

  scope :by_title, -> { order(:title) }

  scope :search, lambda { |filter = {}|
    if filter[:term].present?
      where(
        'title ILIKE ? OR name ILIKE ? OR email ILIKE ? OR id::TEXT LIKE ?',
        "%#{filter[:term]}%", "%#{filter[:term]}%", "%#{filter[:term]}%", filter[:term]
      )
    end
  }

  def to_label
    title
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
