require 'rails_helper'

RSpec.describe WelcomeAuthorizer, type: :authorizer do

  let(:guest_user) { nil }
  let(:one_user) { double('Authenticated', user_group?: true, welcome_ids: [1]) }
  let(:two_user) { double('Authenticated', user_group?: true, welcome_ids: [2]) }
  let(:admin_user) { double('Authenticated', admin_group?: true) }

  context '#index' do
    describe 'authorize' do
      it { expect(WelcomeAuthorizer.new(guest_user, 'index')).to be_authorized }

      it { expect(WelcomeAuthorizer.new(one_user, 'index')).to be_authorized }

      it { expect(WelcomeAuthorizer.new(two_user, 'index')).to be_authorized }

      it { expect(WelcomeAuthorizer.new(admin_user, 'index')).to be_authorized }
    end
  end

end
