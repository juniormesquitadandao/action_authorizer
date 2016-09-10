class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  desc 'Creates an initializer with default action_authorizer configuration and copy locale file'

  def create_application_authorize_file
    create_file 'app/authorizers/application_authorizer.rb', <<-RUBY
class ApplicationAuthorizer < ActionAuthorizer::Base
end
    RUBY
  end

  def update_application_controller_file
    inject_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::Base" do <<-RUBY
  \n
  include ActionAuthorizer::Config

  before_action :authorize!, unless: :devise_controller?

  # def authenticated
  #   current_user
  # end

  # def respond_unauthorized_on_production_environment
  #   render file: Rails.root.join('public/404'), layout: false, status: :not_found
  # end
      RUBY
    end
  end

  def create_application_helper_file
    create_file 'app/helpers/authorizer_helper.rb', <<-RUBY
module AuthorizerHelper
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

  def update_rails_helper_file
    inject_into_file 'spec/rails_helper.rb', after: "RSpec.configure do |config|" do <<-RUBY
  \n
  # Skip before_action :authorize! to all controller spec
  config.before :each, type: :controller do
    allow(controller).to receive(:authorize!)
  end
      RUBY
    end
  end

end