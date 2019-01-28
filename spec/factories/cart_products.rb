FactoryGirl.define do
  factory :cart_product do
    cart_id 1
    qty 1
    price 120
    product
    cart
  end
end
