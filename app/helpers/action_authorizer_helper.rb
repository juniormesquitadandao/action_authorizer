module ActionAuthorizerHelper
  def authorized?(action, params = {})
    authozired_controller? controller_path, action, params
  end

  def authozired_controller?(controller, action, params = {})
    ActionAuthorizer::Base.authorized?(current_user, controller, action, params)
  end
end
