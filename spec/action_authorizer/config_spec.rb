RSpec.describe 'Config' do

  before(:each) do
    @application_controller = ApplicationController.new
    @welcome_controller = WelcomeController.new
    @dashboad_admins_controller = Dashboard::AdminsController.new
  end

  it '#authenticated' do
    expect(@application_controller).to receive(:current_user)
    @application_controller.authenticated
  end

  it '#unauthorized_response_on_production' do
    expect(@application_controller).to receive(:render).with(file: Rails.root.join('public/404'), layout: false, status: :not_found)
    @application_controller.unauthorized_response_on_production
  end

  context '#authorize!' do
    it 'success' do
      allow(@application_controller).to receive(:unauthorized?).and_return( false )

      expect(@application_controller).to receive(:unauthorized?)

      @application_controller.authorize!
    end

    it 'fail' do
      allow(@application_controller).to receive(:unauthorized?).and_return( true )

      expect(@application_controller).to receive(:unauthorize!)

      @application_controller.authorize!
    end
  end

  context '#unauthorized?' do

    describe 'success when' do
      it 'result nil' do
        expect(@welcome_controller).to be_unauthorized
      end

      it 'result false' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( false )
        expect(@welcome_controller).to be_unauthorized
      end

      it 'result values exclude params value' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [] } )
        allow_any_instance_of(Hash).to receive(:except).and_return( { key: 1 } )
        expect(@welcome_controller).to be_unauthorized

        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [1, 2] } )
        allow_any_instance_of(Hash).to receive(:except).and_return( { key: 3 } )
        expect(@welcome_controller).to be_unauthorized
      end
    end

    describe 'fail when' do
      it 'result true' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( true )
        expect(@welcome_controller).not_to be_unauthorized
      end

      it 'result present and params empty' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( {} )
        expect(@welcome_controller).not_to be_unauthorized

        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [] } )
        expect(@welcome_controller).not_to be_unauthorized

        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [1, 2] } )
        expect(@welcome_controller).not_to be_unauthorized
      end

      it 'result values include params value' do
        allow_any_instance_of(WelcomeAuthorizer).to receive(:index).and_return( { key: [1, 3, 2] } )
        allow_any_instance_of(Hash).to receive(:except).and_return( { key: 3 } )
        expect(@welcome_controller).not_to be_unauthorized
      end
    end
  end

  context '#unauthorize!' do
    it 'when production env' do
      allow(Env).to receive(:production?).and_return( true )

      expect(@application_controller).to receive(:unauthorized_response_on_production)

      @application_controller.unauthorize!
    end

    it 'when others env' do
      message = "No route matches [GET] \"/\""

      expect { @application_controller.unauthorize! }.to raise_error ActionController::RoutingError, message
    end
  end

  it 'instance authorizer' do
    welcome_authorizer = double 'WelcomeAuthorizer', unauthorized?: true
    expect(WelcomeAuthorizer).to receive(:new).with(nil, 'index', {}) { welcome_authorizer }
    @welcome_controller.unauthorized?
  end

  it 'instance authorizer with module' do
    dashboard_admins_authorizer = double 'Dashboard::AdminsAuthorizer', unauthorized?: true
    expect(Dashboard::AdminsAuthorizer).to receive(:new).with(nil, 'index', {}) { dashboard_admins_authorizer }
    @dashboad_admins_controller.unauthorized?
  end

  it 'not instance authorizer' do
    allow(@welcome_controller).to receive(:controller_path) { 'others' }
    expect { @welcome_controller.unauthorized? }.to raise_error NameError
  end

  it 'instance authorizer with module' do
    allow(@dashboad_admins_controller).to receive(:controller_path) { 'dashboad/others' }
    expect { @dashboad_admins_controller.unauthorized? }.to raise_error NameError
  end

end