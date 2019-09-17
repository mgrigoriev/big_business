# frozen_string_literal: true

class Client < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  scope :by_title, -> { order(:title) }
end
