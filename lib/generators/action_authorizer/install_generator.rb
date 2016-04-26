module ActionAuthorizer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("..", __FILE__)

      desc "Creates an initializer with default action_authorizer configuration and copy locale file"

      def create_application_authorize_file
        create_file "app/authorizers/application_authorizer.rb", <<-RUBY
class ApplicationAuthorizer < ActionAuthorizer::Base
  def authenticated
    request.env['warden'].user
  end
end
        RUBY
      end

      def update_routes
        insert_into_file "config/routes.rb", "  authorize! do\n" , :after => "Rails.application.routes.draw do\n"
        insert_into_file "config/routes.rb", "\n  end" , :before => "\nend"
      end

    end
  end
end