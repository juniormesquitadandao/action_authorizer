class Country::CitysAuthorizer < ApplicationAuthorizer

  def index
    authenticated
  end

  def show
    authenticated
  end

  def new
    authenticated.try :admin_group?
  end

  def edit
    authenticated.try :admin_group?
  end

  def create
    authenticated.try :admin_group?
  end

  def update
    authenticated.try :admin_group?
  end

  def destroy
    authenticated.try :admin_group?
  end

end