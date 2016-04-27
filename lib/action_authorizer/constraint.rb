class ActionAuthorizer::Constraint
  def matches? request
    @request = request

    params = request.params.dup
    controller = params.extract!(:controller)[:controller]
    authorizer = "#{controller}_authorizer".classify.constantize
    action = params.extract!(:action)[:action]

    authorizer.new(authenticated, action, params).authorized?
  end

  def authenticated
    @request.env['warden'].user
  end
end