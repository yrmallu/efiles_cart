class AddTotalCountToCart < ActiveRecord::Migration[5.0]
  def change
    add_column :carts, :total, :decimal, precision: 5, scale: 2, default: 0
    add_column :carts, :product_count, :integer, default: 0
  end
end
