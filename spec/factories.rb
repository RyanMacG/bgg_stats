FactoryGirl.define do
  factory :user do
    name                  "Ryan MacGillivray"
    email                 "ryan@ryanmacg.com"
    password              "barbaz"
    password_confirmation "barbaz"
  end
end