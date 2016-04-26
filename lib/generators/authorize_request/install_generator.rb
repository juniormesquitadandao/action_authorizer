module AuthorizeRequest
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("..", __FILE__)

      desc "Creates an initializer with default authorize_request configuration and copy locale file"

      def create_application_request_authorize_file
        create_file "app/authorizers/application_authorize_request.rb", <<-RUBY
class ApplicationAuthorizeRequest
  include AuthorizeRequest
end
        RUBY
      end

      def create_application_authorize_file
        create_file "app/authorizers/application_authorizer.rb", <<-RUBY
class ApplicationAuthorizer < ApplicationAuthorizeRequest
  # All methods below can be used in all authorizers.

  # Skip the following parameters for all requests [:utf8, :_method, :authenticity_token, :commit].
  # skip_default_params

  # Authorize the predefined actions with their respective parameters.
  # authorize_default_params

  # Specify which parameters you want to skip all requests.
  # def skiped_params
  #   [:param_one, :param_two, ...]
  # end

  # Specify which parameters you want to use for each action.
  # def authorize_params
  #   {
  #     index: {
  #       param_one: [], param_two: %w( value_one, value_two, ...)
  #     }
  #   }
  # end
end
        RUBY
      end

      def update_routes
        insert_into_file "config/routes.rb", "  constraints -> (request){ ApplicationAuthorizeRequest.can? request } do\n" , :after => "Rails.application.routes.draw do\n"
        insert_into_file "config/routes.rb", "\n  end" , :before => "\nend"
      end

    end
  end
end