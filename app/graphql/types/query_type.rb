module Types
  class QueryType < Types::BaseObject
    field :clients, [Types::ClientType], null: false
    field :orders, [Types::OrderType], null: false

    def clients
      Client.all
    end

    def orders
      Order.all
    end
  end
end
