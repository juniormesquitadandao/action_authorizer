class WelcomeAuthorizer < ApplicationAuthorizer
  skip_authentication

  def index
    true
  end

end
