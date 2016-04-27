require 'rails/generators/resource_helpers'

class ActionAuthorizer::AuthorizerGenerator < Rails::Generators::NamedBase
  include Rails::Generators::ResourceHelpers

  source_root File.expand_path('../templates', __FILE__)

  argument :actions, type: :array, default: [], banner: "action action"

  check_class_collision suffix: "Authorizer"

  def create_authorizer_files
    template 'authorizer.rb', File.join('app/authorizers', controller_class_path, "#{controller_file_name}_authorizer.rb")
  end
end