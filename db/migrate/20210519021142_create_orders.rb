class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.integer :postage, null: false, default: 800
      t.integer :total_payment, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.datetime :created_at, null: false
      t.string :updated_at, null: false, default: ""

      t.timestamps
    end
  end
end
