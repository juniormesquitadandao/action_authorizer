RSpec.describe 'Base' do

  it { expect { ApplicationAuthorizer.new({}, :index).unauthorized? }.to raise_error NoMethodError }

  context 'defineds' do

    describe '#authorized?' do
      before(:each) { expect_any_instance_of(ActionAuthorizer::Base).to receive(:unauthorized?) { false } }

      it { expect(WelcomeAuthorizer.new(nil, :index)).to be_authorized }
      it { expect(Dashboard::AdminsAuthorizer.new(nil, :index)).to be_authorized }
    end

    describe '#unauthorized?' do
      before(:each) { expect_any_instance_of(ActionAuthorizer::Base).to receive(:unauthorized?) { true } }

      it { expect(WelcomeAuthorizer.new(nil, :index)).to be_unauthorized }
      it { expect(Dashboard::AdminsAuthorizer.new(nil, :index)).to be_unauthorized }
    end
  end

end