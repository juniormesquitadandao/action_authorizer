class ActionAuthorizer::ResultError < RuntimeError
  def message
    "Result (#{super}) is not FalseClass or TrueClass"
  end
end
