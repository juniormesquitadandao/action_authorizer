require 'rails_helper'

RSpec.describe ReactsAuthorizer, type: :authorizer do
  let(:guest_user) { nil }
  before(:each) do
    @user1 = User.create!(email: 'user1@email.com', password: '123456')
    @user2 = User.create!(email: 'user2@email.com', password: '123456')

    @thought1 = Thought.create!(user: @user1)
    @thought2 = Thought.create!(user: @user2)

    @react1 = @thought1.react(:agree, @user1)
    @react2 = @thought2.react(:agree, @user2)
  end

  describe '#react' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:react) }
      it { expect(@user2).to be_authorized(:react) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:react) }
    end
  end

  describe '#remove_reaction' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:remove_reaction, reactable_id: @thought1, reactable_type: 'Thought') }
      it { expect(@user2).to be_authorized(:remove_reaction, reactable_id: @thought2, reactable_type: 'Thought') }
    end

    context 'when not authorize' do
      it { expect(@user1).to be_unauthorized(:edit, id: @thought2) }
      it { expect(@user2).to be_unauthorized(:edit, id: @thought1) }
      it { expect(guest_user).to be_unauthorized(:remove_reaction, reactable_type: 'Thought') }
    end
  end
end