class HousesAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

  def show
    { id: @authenticated.try(:house_ids) || [] }
  end

  def new
    @authenticated
  end

  def edit
    { id: @authenticated.try(:house_ids) || [] }
  end

  def create
    @authenticated
  end

  def update
    { id: @authenticated.try(:house_ids) || [] }
  end

  def destroy
    { id: @authenticated.try(:house_ids) || [] }
  end

end