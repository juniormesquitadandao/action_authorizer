class UsersAuthorizer < ApplicationAuthorizer

  def index
    authenticated.admin?
  end

  def show
    authenticated.admin?
  end

  def new
    authenticated.admin?
  end

  def edit
    authenticated.admin?
  end

  def create
    authenticated.admin?
  end

  def update
    authenticated.admin?
  end

  def destroy
    authenticated.admin?
  end

end