class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  source_root File.expand_path('../templates', __FILE__)

  def create_authorizers
    template 'app/authorizers/action_authorizer/base.rb'
    template 'app/authorizers/application_authorizer.rb'
  end
end