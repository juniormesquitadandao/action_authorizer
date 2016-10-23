FactoryGirl.define do
  factory :user do
    name "Administrator"
    admin true
    email "admin@email.com"
    password "pass"
    password_confirmation "pass"
  end
end
