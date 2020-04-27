module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :client, Types::ClientType, null: false
    field :slug, String, null: false
    field :title, String, null: false
    field :status, String, null: false
    field :invoice_number, Integer, null: true
    field :price, Integer, null: true
    field :cost, Integer, null: true
    field :payed_amount, Integer, null: true
    field :profit, Integer, null: true

    def profit
      object.profit_cents
    end
  end
end
