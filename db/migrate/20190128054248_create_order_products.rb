class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.integer :qty
      t.string :status

      t.timestamps
    end
  end
end
