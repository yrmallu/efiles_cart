FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "category#{n}" }
    description "MyText"
  end

  factory :invalid_category, class: :Category do
    name nil
  end
end
