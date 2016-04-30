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

  include ActionAuthorizer

  # def authenticated
  #   current_user
  # end

  # def unauthorized_response_on_production
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
      RUBY
    end
  end
end