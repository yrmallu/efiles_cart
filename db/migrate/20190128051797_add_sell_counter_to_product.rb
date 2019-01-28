class AddSellCounterToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :sell_counter, :integer, default: 0
  end
end
