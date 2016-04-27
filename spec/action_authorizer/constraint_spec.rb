RSpec.describe 'Constraint' do

  let(:request) { double 'request', params: { controller: 'welcome', action: 'index' } }

  context '#matches?' do
    it { expect(ActionAuthorizer::Constraint.new).not_to be_matches request }

    it do
      expect_any_instance_of(WelcomeAuthorizer).to receive(:authorized?){ true }
      expect(ActionAuthorizer::Constraint.new).to be_matches request
    end

    it do
      expect(WelcomeAuthorizer).to receive(:new).with('index', {}){ double 'WelcomeAuthorizer', authorized?: false }
      ActionAuthorizer::Constraint.new.matches? request
    end
  end

end