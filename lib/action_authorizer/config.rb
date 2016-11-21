require 'active_support/concern'

module ActionAuthorizer::Config
  extend ActiveSupport::Concern

  def authenticated
    current_user
  end

  def respond_unauthorized_on_production_environment
    render file: Rails.root.join('public/404'), layout: false, status: :not_found
  end

  def authorize!
    unauthorize! if unauthorized?
  end

  def unauthorized?
    authorizer = "#{controller_path}_authorizer".classify.constantize
    authorizer.new(authenticated, action_name.to_sym, params.except(:controller, :action)).unauthorized?
  end

  def unauthorize!
    if Rails.env.production?
      respond_unauthorized_on_production_environment
    else
      raise ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
    end
  end

end