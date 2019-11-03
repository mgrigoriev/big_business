# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
  #  it { should have_many(:orders) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
  end
end
