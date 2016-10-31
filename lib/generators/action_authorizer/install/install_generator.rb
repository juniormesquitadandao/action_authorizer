class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  desc 'Creates an initializer with default action_authorizer configuration and copy locale file'

  def create_application_authorize_file
    create_file 'app/authorizers/application_authorizer.rb', <<-RUBY
class ApplicationAuthorizer < ActionAuthorizer::Base
end
    RUBY
  end

  def create_action_authorizer_helper_file
    create_file 'app/helpers/action_authorizer_helper.rb', <<-RUBY
module ActionAuthorizerHelper
  # Add helpers to check authorization authenticated.
  # def unauthorized? controller, action, params = {}
  # def authorized? controller, action, params = {}
  # ex.:
  #   <%= link_to 'Models', models_path if authorized? :models, :index %>
  #   <%= link_to 'Models Dashboard', dashboard_models_path if authorized? 'dashborad/models', :index %>
  #   <%= link_to 'Model', model_path(@model) if authorized? :models, :show, id: @model.id %>
  #   <%= link_to 'Model', edit_model_path(@model) if authorized? :models, :edit, id: @model.to_param %>
  include ActionAuthorizer::Helper

  # def authenticated
  #   current_user
  # end
end
    RUBY
  end

end