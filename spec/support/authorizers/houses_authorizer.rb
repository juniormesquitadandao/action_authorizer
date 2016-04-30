class HousesAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

  def show
    if @authenticated.try(:user?)
      { id: @authenticated.house_ids }
    elsif @authenticated.try(:admin?)
      true
    end
  end

  def new
    @authenticated
  end

  def edit
    if @authenticated.try(:user?)
      { id: @authenticated.house_ids }
    elsif @authenticated.try(:admin?)
      true
    end
  end

  def create
    @authenticated
  end

  def update
    if @authenticated.try(:user?)
      { id: @authenticated.house_ids }
    elsif @authenticated.try(:admin?)
      true
    end
  end

  def destroy
    if @authenticated.try(:user?)
      { id: @authenticated.house_ids }
    elsif @authenticated.try(:admin?)
      true
    end
  end

end