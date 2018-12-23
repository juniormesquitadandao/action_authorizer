require 'action_authorizer/result_error.rb'

RSpec.describe 'ActionAuthorizer::ResultError' do
  it { expect(ActionAuthorizer::ResultError.new('').message).to eq('Result () is not a FalseClass or TrueClass') }
end