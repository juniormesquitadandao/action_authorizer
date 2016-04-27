RSpec.describe 'Constraint' do

  def request controller, action, others = {}
     params = {
      controller: controller.to_s,
      action: action.to_s,
     }
     params.merge! others

     request = double('request', params: params)

     request
  end

  it { expect(ActionAuthorizer::Constraint.new).to be_matches request :welcome, :index }

end
