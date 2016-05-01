class UsersAuthorizer < ApplicationAuthorizer

  def index
    authenticated.try :admin_group?
  end

end
