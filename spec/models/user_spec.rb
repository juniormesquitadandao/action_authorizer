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
end
