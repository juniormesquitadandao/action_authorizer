class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  desc 'Creates an initializer with default action_authorizer configuration and copy locale file'

  def create_application_authorize_file
    create_file 'app/authorizers/application_authorizer.rb', <<-RUBY
class ApplicationAuthorizer < ActionAuthorizer::Base
end
    RUBY
  end

  def update_application_controller_file
    inject_into_file 'app/controllers/application_controller.rb', before: "\nend" do <<-RUBY
\n
  before_action :authorize!, unless: :devise_controller?

  include ActionAuthorizer::Config

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
      RUBY
    end
  end

  def update_application_helper_file
    inject_into_file 'app/helpers/application_helper.rb', before: "\nend" do <<-RUBY
\n
  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   authozired? :gems, :index
  #   authozired? 'gems', 'index'
  #   authozired? 'dashborad/gems', 'index'
  #   authozired? :gems, :show, id: 1
  #   authozired? :gems, :show, id: '1'
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end
      RUBY
    end
  end

  def update_rails_helper_file
    inject_into_file 'spec/rails_helper.rb', before: "\nend" do <<-RUBY
\n
  # Skip before_action :authorize! to all controller spec
  config.before :each, type: :controller do
    allow(controller).to receive(:authorize!)
  end
      RUBY
    end
  end

end