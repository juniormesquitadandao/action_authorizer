FactoryGirl.define do
  factory :user do
    name "One"
    admin false
    email "one@email.com"
    password "password"
    password_confirmation "password"
  end
end
