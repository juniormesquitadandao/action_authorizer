require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should have_many(:products).dependent(:restrict) }

  %w( name admin email password password_confirmation remember_me ).each do |attribute|
    it { should allow_mass_assignment_of(attribute.to_sym) }
  end

  it { should validate_presence_of(:name) }
end
