class CreateOrders < ActiveRecord::Migration[6.0]
  def up
    safety_assured do
      execute "CREATE TYPE orders_status AS ENUM ('pending', 'in_progress', 'done')"
    end

    create_table :orders do |t|
      t.references :client, foreign_key: true, null: false
      t.string :slug
      t.string :title
      t.column :status, :orders_status, null: false, default: 'pending', index: true
      t.integer :invoice_number
      t.date :invoice_date

      t.monetize :price
      t.monetize :cost
      t.monetize :payed_amount

      t.timestamps
    end
  end

  def down
    drop_table :orders

    safety_assured do
      execute 'DROP TYPE orders_status'
    end
  end
end
