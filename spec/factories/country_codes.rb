FactoryGirl.define do
  factory :country_code do
    name "India"
    sequence(:code) { |n| n }
  end
end
