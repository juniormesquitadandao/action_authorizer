class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :authorize!, unless: :devise_controller?

  private

  def authorize!
    unauthorize! unless authorized?
  end

  def authorized?
    ActionAuthorizer::Base.authorized?(current_user, controller_path, action_name, params.except(:controller, :action))
  end

  def unauthorize!
    if request.format.json?
      render(json: {status: 404, error: 'Not Found'}, status: :not_found)
    elsif Rails.env.production?
      render(file: Rails.root.join('public/404'), layout: false, status: :not_found)
    else
      raise(ActionController::RoutingError, "No route matches [#{request.env['REQUEST_METHOD']}] #{request.env['PATH_INFO'].inspect}")
    end
  end
end
