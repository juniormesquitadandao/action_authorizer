require "rails_helper"

RSpec.describe WelcomeController, :type => :routing do

  describe "routing" do

    it "routes to #index" do
      env = ActionDispatch::TestRequest.new({}).env
      env['warden'] = double('user', authenticate?: nil)
      allow_any_instance_of(ActionDispatch::Request).to receive(:env).and_return(env)

      is_expected.to route(:get, "/").to("welcome#index")
    end

  end
end
