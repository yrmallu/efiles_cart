class AddAuthyIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :authy_id, :integer, default: 0
    add_column :users, :cellphone, :string
    add_column :users, :country_code_id, :integer
  end
end
