RSpec.describe 'Routes' do

  let(:mapper) do
    route_set = ActionDispatch::Routing::RouteSet.new
    ActionDispatch::Routing::Mapper.new route_set
  end

  context '#authorize!' do
    it { expect(mapper).to be_respond_to :authorize! }

    it do
      expect(mapper).to receive(:constraints).with(ActionAuthorizer::Constraint)
      mapper.authorize!
    end
  end

end