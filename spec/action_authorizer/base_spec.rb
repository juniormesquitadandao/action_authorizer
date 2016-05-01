RSpec.describe 'Base' do

  it { expect { ApplicationAuthorizer.new(nil, 'index').unauthorized? }.to raise_error NoMethodError }

  it { expect(WelcomeAuthorizer.new(nil, 'index')).to be_unauthorized }

  it { expect(Dashboard::AdminsAuthorizer.new(nil, 'index')).to be_unauthorized }

end