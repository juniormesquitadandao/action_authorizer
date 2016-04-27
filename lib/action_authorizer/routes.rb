class ActionDispatch::Routing::Mapper
  def authorize!
    constraints ActionAuthorizer::Constraint.new do
      yield
    end
  end
end