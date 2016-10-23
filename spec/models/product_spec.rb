require 'rails_helper'

RSpec.describe Product, :type => :model do
  it { is_expected.to belong_to(:user) }

  %w( name user_id ).each do |attribute|
    it { is_expected.to allow_mass_assignment_of(attribute.to_sym) }
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:user_id) }


  it "#user_id" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    one = FactoryGirl.create :user

    is_expected.to validate_exclusion_of(:user_id).in_array([admin.id])
  end

  it "::for user" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    one = FactoryGirl.create :user
    two = FactoryGirl.create :user, name: 'Two', email: 'two@email.com'
    guest = nil

    product = FactoryGirl.create :product

    expect(Product.for admin).to eq [product]
    expect(Product.for one).to eq [product]
    expect(Product.for two).to be_empty
    expect(Product.for guest).to eq [product]
  end
end
