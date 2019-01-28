class AddPriceToCartProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :cart_products, :price, :decimal, precision: 5, scale: 2
  end
end
