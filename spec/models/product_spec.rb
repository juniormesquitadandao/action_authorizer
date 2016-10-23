require 'rails_helper'

RSpec.describe Product, :type => :model do
  it { should belong_to(:user) }

  %w( name user_id ).each do |attribute|
    it { should allow_mass_assignment_of(attribute.to_sym) }
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end
