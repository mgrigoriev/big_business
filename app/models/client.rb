# frozen_string_literal: true

class Client < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true, uniqueness: true

  scope :by_title, -> { order(:title) }
end
