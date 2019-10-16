# frozen_string_literal: true

class Client < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true

  scope :by_title, -> { order(:title) }

  scope :search, ->(filters) do
    if filters[:term].present?
      where_sql = <<~SQL.squish
        clients.title ILIKE ? OR
        clients.name ILIKE ? OR
        clients.email ILIKE ? OR
        clients.id::TEXT LIKE ?
      SQL

      where(where_sql, "%#{filters[:term]}%", "%#{filters[:term]}%", "%#{filters[:term]}%", "#{filters[:term]}")
    end
  end
end
