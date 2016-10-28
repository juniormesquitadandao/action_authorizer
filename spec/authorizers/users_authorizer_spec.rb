require 'rails_helper'

RSpec.describe UsersAuthorizer, type: :authorizer do

  let(:guest) { nil }
  let(:user) { double('Authenticated', admin?: false, user_ids: [1]) }
  let(:other) { double('Authenticated', admin?: false, user_ids: [2]) }
  let(:admin) { double('Authenticated', admin?: true) }

  context '#index' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :index)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :index)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :index)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :index)).to be_unauthorized }
    end
  end

  context '#show' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :show, id: 1)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :show, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :show, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :show, id: 2)).to be_unauthorized }
    end
  end

  context '#new' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :new)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :new)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :new)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :new)).to be_unauthorized }
    end
  end

  context '#edit' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :edit, id: 1)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :edit, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :edit, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :edit, id: 2)).to be_unauthorized }
    end
  end

  context '#create' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :create)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :create)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :create)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :create)).to be_unauthorized }
    end
  end

  context '#update' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :update, id: 1)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :update, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :update, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :update, id: 2)).to be_unauthorized }
    end
  end

  context '#destroy' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin, :destroy, id: 1)).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest, :destroy, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(user, :destroy, id: 1)).to be_unauthorized }

      it { expect(UsersAuthorizer.new(other, :destroy, id: 2)).to be_unauthorized }
    end
  end

end