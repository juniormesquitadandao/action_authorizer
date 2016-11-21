require 'active_support/concern'

module ActionAuthorizer::Helper
  extend ActiveSupport::Concern

  def authenticated
    current_user
  end

  def authorized? controller, action, params = {}
    !unauthorized? controller, action, params
  end

  def unauthorized? controller, action, params = {}
    authorizer = "#{controller.to_s}_authorizer".classify.constantize
    authorizer.new(authenticated, action.to_sym, params).unauthorized?
  end

end
