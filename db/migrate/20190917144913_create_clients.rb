# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :title
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
