class OtherPublicAuthorizer < ApplicationAuthorizer

  skip :index

  def index
    true
  end

end