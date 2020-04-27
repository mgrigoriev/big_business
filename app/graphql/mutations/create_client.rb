# frozen_string_literal: true

module Mutations
  class CreateClient < BaseMutation
    argument :title, String, required: true
    argument :name, String, required: false
    argument :email, String, required: false

    field :client, Types::ClientType, null: true
    field :errors, [String], null: false

    def resolve(title:, name: nil, email: nil)
      client = Client.new(title: title, name: name, email: email)
      if client.save
        {
          client: client,
          errors: []
        }
      else
        {
          client: nil,
          errors: client.errors.full_messages
        }
      end
    end
  end
end
