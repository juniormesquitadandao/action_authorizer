RSpec.describe 'Config' do

  before(:each) do
    @application = ApplicationController.new
    @welcome = WelcomeController.new
  end

  it '#authenticated' do
    expect(@application).to receive(:current_user)
    @application.authenticated
  end

  it '#unauthorized_response_on_production' do
    expect(@application).to receive(:render).with(file: Rails.root.join('public/404'), layout: false, status: :not_found)
    @application.unauthorized_response_on_production
  end

  context '#authorize!' do
    it 'success' do
      allow(@application).to receive(:unauthorized?).and_return( false )

      expect(@application).to receive(:unauthorized?)

      @application.authorize!
    end

    it 'fail' do
      allow(@application).to receive(:unauthorized?).and_return( true )

      expect(@application).to receive(:unauthorize!)

      @application.authorize!
    end
  end

  context '#unauthorized?' do
    describe 'success when' do
      it 'result nil' do
        expect(@welcome).to be_unauthorized
      end

      it 'result false' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( false )
        expect(@welcome).to be_unauthorized
      end

      it 'result values exclude param value' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [] } )
        allow_any_instance_of(Hash).to receive(:except).and_return( { key: 1 } )
        expect(@welcome).to be_unauthorized
      end

      it 'result values exclude param value' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [1, 2] } )
        allow_any_instance_of(Hash).to receive(:except).and_return( { key: 3 } )
        expect(@welcome).to be_unauthorized
      end
    end

    # describe 'success when params empty and @result' do
    #   it 'nil' do
    #     expect(@welcome).to be_unauthorized
    #   end

    #   it 'false' do
    #     allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( false )
    #     expect(@welcome).to be_unauthorized
    #   end
    # end

    # describe 'success when params any and @result' do
    #   it 'nil' do
    #     allow(@welcome).to receive(:params).and_return( { key: 'value' } )
    #     expect(@welcome).to be_unauthorized
    #   end

    #   it 'false' do
    #     allow(@welcome).to receive(:params).and_return( { key: 'value' } )
    #     allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( false )
    #     expect(@welcome).to be_unauthorized
    #   end
    # end


    # describe 'fail when' do
    #   it 'true' do
    #     allow_any_instance_of(WelcomeAuthorizer).to receive(:index) { true }
    #     expect(@welcome).not_to be_unauthorized
    #   end

    #   it '{}' do
    #     allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( {} )
    #     expect(@welcome).to be_unauthorized
    #   end

    #   it '{}' do
    #     allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: 'value' } )
    #     expect(@welcome).to be_unauthorized
    #   end
    # end
  end
    # def unauthorized?
    #   authorizer = "#{controller_path}_authorizer".classify.constantize

    #   authorizer.new(authenticated, action_name, params.except(:@application, :action)).unauthorized?
    # end

    # def unauthorize!
    #   if Rails.env.production?
    #     unauthorized_response_on_production
    #   else
    #     raise ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
    #   end
    # end

end