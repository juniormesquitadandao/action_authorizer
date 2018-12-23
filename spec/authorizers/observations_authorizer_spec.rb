require 'rails_helper'

RSpec.describe ObservationsAuthorizer, type: :authorizer do
  let(:guest_user) { nil }
  before(:each) do
    @user1 = User.create!(email: 'user1@email.com', password: '123456')
    @user2 = User.create!(email: 'user2@email.com', password: '123456')
  end

  describe '#create' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:create) }
      it { expect(@user2).to be_authorized(:create) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:create) }
    end
  end
end
