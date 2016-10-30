FactoryGirl.define do
  factory :product do
    name "Table"
    user_id { User.find_by_email("user@email.com").try(:id) || create(:user).id }
  end
end
