class ActionAuthorizer::Constraint
  def matches? request
    params = request.params.dup

    controller = params.extract!(:controller)[:controller]
    authorizer = "#{controller}_authorizer".classify.constantize

    action = params.extract!(:action)[:action]
    authorizer.new(action, params).authorized?
  end
end