require 'rails_helper'

RSpec.describe ThoughtsAuthorizer, type: :authorizer do
  let(:guest_user) { nil }
  before(:each) do
    @user1 = User.create!(email: 'user1@email.com', password: '123456')
    @user2 = User.create!(email: 'user2@email.com', password: '123456')

    @thought1 = Thought.create!(user: @user1)
    @thought2 = Thought.create!(user: @user2)
  end

  describe '#index' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:index) }
      it { expect(@user2).to be_authorized(:index) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:index) }
    end
  end

  describe '#show' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:show, id: @thought1) }
      it { expect(@user1).to be_authorized(:show, id: @thought2) }

      it { expect(@user2).to be_authorized(:show, id: @thought2) }
      it { expect(@user2).to be_authorized(:show, id: @thought1) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:show) }
    end
  end

  describe '#new' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:new) }
      it { expect(@user2).to be_authorized(:new) }
    end

    context 'when not authorize' do
      it { expect(guest_user).to be_unauthorized(:new) }
    end
  end

  describe '#edit' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:edit, id: @thought1) }
      it { expect(@user2).to be_authorized(:edit, id: @thought2) }
    end

    context 'when not authorize' do
      it { expect(@user1).to be_unauthorized(:edit, id: @thought2) }
      it { expect(@user2).to be_unauthorized(:edit, id: @thought1) }
      it { expect(guest_user).to be_unauthorized(:edit) }
    end
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

  describe '#update' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:update, id: @thought1) }
      it { expect(@user2).to be_authorized(:update, id: @thought2) }
    end

    context 'when not authorize' do
      it { expect(@user1).to be_unauthorized(:update, id: @thought2) }
      it { expect(@user2).to be_unauthorized(:update, id: @thought1) }
      it { expect(guest_user).to be_unauthorized(:update) }
    end
  end

  describe '#destroy' do
    context 'when authorize' do
      it { expect(@user1).to be_authorized(:destroy, id: @thought1) }
      it { expect(@user2).to be_authorized(:destroy, id: @thought2) }
    end

    context 'when not authorize' do
      it { expect(@user1).to be_unauthorized(:destroy, id: @thought2) }
      it { expect(@user2).to be_unauthorized(:destroy, id: @thought1) }
      it { expect(guest_user).to be_unauthorized(:destroy) }
    end
  end
end