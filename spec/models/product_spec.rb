require 'rails_helper'

RSpec.describe Product, :type => :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }


  it "#user_id" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    user = FactoryGirl.create :user

    is_expected.to validate_exclusion_of(:user_id).in_array([admin.id])
  end

  it "::for user" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    user = FactoryGirl.create :user
    other = FactoryGirl.create :user, name: 'Other', email: 'other@email.com'
    guest = nil

    product = FactoryGirl.create :product

    expect(Product.for admin).to eq [product]
    expect(Product.for user).to eq [product]
    expect(Product.for other).to be_empty
    expect(Product.for guest).to eq [product]
  end
end
