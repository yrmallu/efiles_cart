class AddOutOfStockToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :out_of_stock, :boolean, default: false
  end
end
