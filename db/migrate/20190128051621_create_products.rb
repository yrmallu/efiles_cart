class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :product_type_id
      t.integer :no_of_pages
      t.string :publisher
      t.datetime :publication_date
      t.string :isbn
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.string :writer_name
      t.attachment :image
      t.attachment :product_file

      t.timestamps
    end
  end
end
