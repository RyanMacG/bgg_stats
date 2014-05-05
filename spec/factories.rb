FactoryGirl.define do
  factory :user do
    name                  "Ryan MacGillivray"
    sequence(:email){ |n| "user#{n}@example.com" }
    password              "barbaz"
    password_confirmation "barbaz"
  end
end