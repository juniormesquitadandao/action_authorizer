class UsersAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

end
