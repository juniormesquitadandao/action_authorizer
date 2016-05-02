RSpec.describe 'Base' do

  it { expect { ApplicationAuthorizer.new(nil, :index).unauthorized? }.to raise_error NoMethodError }

  context 'defineds' do
    before(:each) { expect_any_instance_of(ActionAuthorizer::Base).to receive(:unauthorized?) { true } }

    it { expect(WelcomeAuthorizer.new(nil, :index)).to be_unauthorized }

    it { expect(Dashboard::AdminsAuthorizer.new(nil, :index)).to be_unauthorized }
  end

end