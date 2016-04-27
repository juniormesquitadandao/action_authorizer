require "active_support/core_ext/object/try"
require "active_support/core_ext/hash/slice"

class ActionDispatch::Routing::Mapper
  def authorize!
    constraints ActionAuthorizer::Constraint.new do
      yield
    end
  end
end