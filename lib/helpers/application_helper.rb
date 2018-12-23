module ApplicationHelper
  def authorized?(action, params = {})
    ActionAuthorizer::Base.authorized?(current_user, controller_path, action, params)
  end
end
