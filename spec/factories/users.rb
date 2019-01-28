FactoryGirl.define do
  factory :user do
    before(:create){|user| user.define_singleton_method(:register_in_authy_and_send_mail){}}
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:cellphone) { |n| "12345678#{n}" }
    authy_id 123456
    password 'test1234'
    password_confirmation 'test1234'
    sequence(:country_code_id) { |n| n }

    trait :admin do
      after(:create) do |user|
        user.update_attribute(:admin_role, true)
      end
    end
  end

end
