FactoryGirl.define do
  factory :user do
    name     "Factory User"
    email    "user@factory.com"
    password "whatever"
    password_confirmation "whatever"
  end
end
