require 'rails_helper'

RSpec.describe WelcomeAuthorizer, type: :authorizer do

  let(:guest) { nil }
  let(:user) { double('Authenticated', admin?: false, user_ids: [1]) }
  let(:other) { double('Authenticated', admin?: false, user_ids: [2]) }
  let(:admin) { double('Authenticated', admin?: true) }

  context '#index' do
    describe 'authorize' do
      it { expect(WelcomeAuthorizer.new(guest, :index)).to be_authorized }

      it { expect(WelcomeAuthorizer.new(user, :index)).to be_authorized }

      it { expect(WelcomeAuthorizer.new(other, :index)).to be_authorized }

      it { expect(WelcomeAuthorizer.new(admin, :index)).to be_authorized }
    end
  end

end