FactoryGirl.define do
  factory :user do
    name "User"
    admin false
    email "user@email.com"
    password "password"
    password_confirmation "password"
  end
end
