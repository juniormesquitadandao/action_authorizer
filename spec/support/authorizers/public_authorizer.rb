require File.expand_path('../application_authorizer', __FILE__)

class PublicAuthorizer < ApplicationAuthorizer

  skip_authentication

  def index
    true
  end

end