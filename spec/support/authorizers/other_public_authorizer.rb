require File.expand_path('../application_authorizer', __FILE__)

class OtherPublicAuthorizer < ApplicationAuthorizer

  skip_authentication_only :index

  def index
    true
  end

end