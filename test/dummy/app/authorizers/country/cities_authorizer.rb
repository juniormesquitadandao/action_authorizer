class Country::CitiesAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

  def show
    @authenticated
  end

  def new
    @authenticated
  end

  def edit
    @authenticated.try :admin_group?
  end

  def create
    @authenticated
  end

  def update
    @authenticated.try :admin_group?
  end

  def destroy
    @authenticated.try :admin_group?
  end

end
