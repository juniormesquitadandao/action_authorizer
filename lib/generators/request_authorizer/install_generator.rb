module RequestAuthorizer
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("..", __FILE__)

      desc "Creates an initializer with default request_authorizer configuration and copy locale file"

      def create_application_request_authorizer_file
        create_file "app/authorizers/application_request_authorizer.rb", <<-RUBY
class ApplicationRequestAuthorizer
  include RequestAuthorizer
end
        RUBY
      end

      def create_application_authorizer_file
        create_file "app/authorizers/application_authorizer.rb", <<-RUBY
class ApplicationAuthorizer < ApplicationRequestAuthorizer
  # skip_default_params
  # authorizer_default_params
end
        RUBY
      end

      def update_routes
        insert_into_file "config/routes.rb", "  constraints -> (request){ ApplicationRequestAuthorizer.can? request } do\n" , :after => "Rails.application.routes.draw do\n"
        insert_into_file "config/routes.rb", "\n  end" , :before => "\nend"
      end

    end
  end
end