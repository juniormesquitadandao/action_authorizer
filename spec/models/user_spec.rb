require 'rails_helper'

RSpec.describe User, :type => :model do
  it { is_expected.to have_many(:products).dependent(:restrict_with_error) }

  it { is_expected.to validate_presence_of(:name) }

  it "#to_s" do
    user = FactoryGirl.build :user
    expect(user.to_s).to eq "User (user@email.com)"
  end

  it "::for user" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    user = FactoryGirl.create :user
    other = FactoryGirl.create :user, name: 'Other', email: 'other@email.com'
    guest = nil

    expect(User.for admin).to eq [user, other]
    expect(User.for user).to be_empty
    expect(User.for other).to be_empty
    expect(User.for guest).to be_empty
  end
end
