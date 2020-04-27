module Types
  class ClientType < Types::BaseObject
    field :id, ID, null: false
    field :slug, String, null: false
    field :title, String, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
  end
end
