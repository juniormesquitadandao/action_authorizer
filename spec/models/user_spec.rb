require 'rails_helper'

RSpec.describe User, :type => :model do
  it { is_expected.to have_many(:products).dependent(:restrict) }

  %w( name admin email password password_confirmation remember_me ).each do |attribute|
    it { is_expected.to allow_mass_assignment_of(attribute.to_sym) }
  end

  it { is_expected.to validate_presence_of(:name) }

  it "#to_s" do
    user = FactoryGirl.build :user
    expect(user.to_s).to eq "One (one@email.com)"
  end

  it "::for user" do
    admin = FactoryGirl.create :user, name: 'Admin', email: 'admin@email.com', admin: true
    one = FactoryGirl.create :user
    two = FactoryGirl.create :user, name: 'Two', email: 'two@email.com'
    guest = nil

    expect(User.for admin).to eq [one, two]
    expect(User.for one).to eq [admin, two]
    expect(User.for two).to eq [admin, one]
    expect(User.for guest).to eq [admin, one, two]
  end
end
