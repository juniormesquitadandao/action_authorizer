class ActionAuthorizer::ResultError < RuntimeError
  def message
    "Result (#{super}) is not a FalseClass or TrueClass"
  end
end
