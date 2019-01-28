class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products

  def get_status
    order_products.any? { |product| product.status.downcase == 'pending' } ? 'pending' : 'completed'
  end
end
