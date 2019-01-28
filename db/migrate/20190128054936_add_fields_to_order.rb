class AddFieldsToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :total, :decimal, precision: 5, scale: 2, default: 0
    add_column :orders, :product_count, :integer, default: 0
  end
end
