class OtherPublicAuthorizer < ApplicationAuthorizer

  skip_authentication_only :index

  def index
    true
  end

end