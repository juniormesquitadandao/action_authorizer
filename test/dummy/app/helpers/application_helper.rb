module ApplicationHelper

  def authorized? controller, action, params = {}
    !unauthorized? controller, action, params
  end

  def unauthorized? controller, action, params = {}
    authorizer = "#{controller.to_s}_authorizer".classify.constantize
    authorizer.new(authenticated, action.to_s, params).unauthorized?
  end

  def authenticated
    current_user
  end

end