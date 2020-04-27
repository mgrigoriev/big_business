# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_client, mutation: Mutations::CreateClient
  end
end
