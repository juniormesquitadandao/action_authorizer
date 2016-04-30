class HousesAuthorizer < ApplicationAuthorizer

  def index
    @authenticated
  end

  def show
    if @authenticated.try :user_group?
      { id: @authenticated.house_ids }
    else
      @authenticated
    end
  end

  def new
    @authenticated
  end

  def edit
    if @authenticated.try :user_group?
      { id: @authenticated.house_ids }
    else
      @authenticated
    end
  end

  def create
    @authenticated
  end

  def update
    if @authenticated.try :user_group?
      { id: @authenticated.house_ids }
    else
      @authenticated
    end
  end

  def destroy
    if @authenticated.try :user_group?
      { id: @authenticated.house_ids }
    else
      @authenticated
    end
  end

end
