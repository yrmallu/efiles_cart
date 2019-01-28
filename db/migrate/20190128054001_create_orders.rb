class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.string :status
      t.integer :user_id
      t.string :authy_uuid

      t.timestamps
    end
  end
end
