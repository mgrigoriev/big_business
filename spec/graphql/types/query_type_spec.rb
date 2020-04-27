# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'clients' do
    subject(:result) do
      BigBusinessSchema.execute(query).as_json
    end

    let!(:clients) { create_pair(:client) }

    let(:query) do
      %(query {
        clients {
          id
          title
          name
          email
        }
      })
    end

    it 'returns all clients' do
      expect(result.dig('data', 'clients')).to match_array(
        clients.map do |client|
          {
            'id' => client.id.to_s,
            'title' => client.title,
            'name' => client.name,
            'email' => client.email
          }
        end
      )
    end
  end
end
