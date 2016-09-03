require 'rails_helper'

RSpec.describe Devise::RegistrationsAuthorizer, type: :authorizer do

  let(:guest) { nil }
  let(:user) { double('Authenticated') }

  context '#new' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest, :new)).to be_unauthorized }
      it { expect(Devise::RegistrationsAuthorizer.new(user, :new)).to be_unauthorized }
    end
  end

  context '#edit' do
    describe 'authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :edit)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest, :edit)).to be_unauthorized }
    end
  end

  context '#create' do
    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest, :create)).to be_unauthorized }
      it { expect(Devise::RegistrationsAuthorizer.new(user, :create)).to be_unauthorized }
    end
  end

  context '#update' do
    describe 'authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :update)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest, :update)).to be_unauthorized }
    end
  end

  context '#destroy' do
    describe 'authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(user, :destroy)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(Devise::RegistrationsAuthorizer.new(guest, :destroy)).to be_unauthorized }
    end
  end

end