class ActionAuthorizer::InstallGenerator < Rails::Generators::Base # :nodoc:
  source_root File.expand_path('../templates', __FILE__)

  def create_authorizers
    template 'app/authorizers/action_authorizer/base.rb'
    template 'app/authorizers/application_authorizer.rb'
  end

  def create_helpers
    template 'app/helpers/action_authorizer_helper.rb'
  end

  def create_spec_helpers
    template 'spec/action_authorizer_matchers_helper.rb'
  end
end
