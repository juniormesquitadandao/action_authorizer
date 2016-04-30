require 'rails_helper'

RSpec.describe UsersAuthorizer, type: :authorizer do

  let(:guest_user) { nil }
  let(:one_user) { double('Authenticated', user_group?: true, user_ids: [1]) }
  let(:two_user) { double('Authenticated', user_group?: true, user_ids: [2]) }
  let(:admin_user) { double('Authenticated', admin_group?: true) }

  context '#index' do
    describe 'authorize' do
      it { expect(UsersAuthorizer.new(admin_user, 'index')).to be_authorized }
    end

    describe 'not authorize' do
      it { expect(UsersAuthorizer.new(guest_user, 'index')).not_to be_authorized }

      it { expect(UsersAuthorizer.new(one_user, 'index')).not_to be_authorized }

      it { expect(UsersAuthorizer.new(two_user, 'index')).not_to be_authorized }
    end
  end

end
