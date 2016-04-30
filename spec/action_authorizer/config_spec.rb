RSpec.describe 'Config' do

  class Rails
    def self.root
      []
    end
  end

  let(:application) do
    class Application
      include ActionAuthorizer::Config

      def current_user
      end

      def render options
      end

      def controller_path
        'welcome'
      end

      def action_name
        'index'
      end
    end

    Application.new
  end

  it '#authenticated' do
    expect(application).to receive(:current_user)
    application.authenticated
  end

  it '#unauthorized_response_on_production' do
    expect(application).to receive(:render).with(file: Rails.root.join('public/404'), layout: false, status: :not_found)
    application.unauthorized_response_on_production
  end

  context '#authorize!' do
    it 'success' do
      allow(application).to receive(:unauthorized?).and_return( false )

      expect(application).to receive(:unauthorized?)
      application.authorize!
    end

    it 'fail' do
      allow(application).to receive(:unauthorized?).and_return( true )

      expect(application).to receive(:unauthorize!)
      application.authorize!
    end
  end

  # it '#unauthorized?' do
  #   expect_any_instance(WelcomeAuthorizer)
  #   expect(application).to receive(:render).with(file: Rails.root.join('public/404'), layout: false, status: :not_found)
  #   application.unauthorized_response_on_production
  # end

    # def unauthorized?
    #   authorizer = "#{controller_path}_authorizer".classify.constantize

    #   authorizer.new(authenticated, action_name, params.except(:controller, :action)).unauthorized?
    # end

    # def unauthorize!
    #   if Rails.env.production?
    #     unauthorized_response_on_production
    #   else
    #     raise ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
    #   end
    # end

end