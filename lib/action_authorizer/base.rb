class ActionAuthorizer::Base

  def initialize(action, params)
    @action = action
    @params = params
  end

  def authorized?
    send(@action)
  end

end