RSpec.describe 'Constraint' do
  let(:request){ ActionDispatch::TestRequest.new }

  it { expect(ActionAuthorizer::Constraint.new).not_to be_matches request }
end
