FactoryGirl.define do
  factory :product do
    name "Table"
    user {User.find_by_email("admin@email.com") || create(:user) }
  end
end
