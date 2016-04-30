class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  desc 'Creates an initializer with default action_authorizer configuration and copy locale file'

  def create_application_authorize_file
    create_file 'app/authorizers/application_authorizer.rb', <<-RUBY
class ApplicationAuthorizer < ActionAuthorizer::Base
end
    RUBY
  end

  def create_action_authorizer_file
    initializer "action_authorizer.rb" do
      <<-RUBY
class ActionAuthorizer::Constraint
  # def authenticated
  #   @request.env['warden'].user
  # end
end
      RUBY
    end
  end

  def update_routes
    route "authorize! do"
    insert_into_file 'config/routes.rb', "\n  end", before: "\nend"
  end
end